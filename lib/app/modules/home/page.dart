import 'dart:math';

import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/data/models/event.dart';
import 'package:dimipay/app/data/models/notice.dart';
import 'package:dimipay/app/modules/coupon/controller.dart';
import 'package:dimipay/app/modules/event/controller.dart';
import 'package:dimipay/app/modules/home/controller.dart';
import 'package:dimipay/app/modules/home/widget/event_item.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final NoticeController noticeController = Get.find<NoticeController>();
  final EventController eventController = Get.find<EventController>();

  Widget _logoArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('DIMIPAY', style: TextStyle(color: Color.fromRGBO(46, 164, 171, 1), fontFamily: 'Montserrat', fontSize: 26)),
        Row(
          children: [
            Obx(
              () => DPIconButton(
                'asset/images/event.svg',
                badgeNumber: Get.find<CouponController>().coupons.value?.length,
                onTap: () {
                  Get.toNamed(Routes.COUPON);
                },
              ),
            ),
            const SizedBox(width: 12),
            DPIconButton(
              'asset/images/profile.svg',
              onTap: () {
                Get.toNamed(Routes.ACCOUNTINFO);
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _notice(Notice notice) {
    return Row(
      children: [
        SvgPicture.asset('asset/images/notice.svg', color: DPColors.MAIN_THEME),
        const SizedBox(width: 24),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notice.title,
                style: DPTextTheme.REGULAR_IMPORTANT,
              ),
              const SizedBox(height: 4),
              Text(
                notice.description,
                style: DPTextTheme.DESCRIPTION,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _noticeArea() {
    return noticeController.obx(
      (notices) {
        if (notices != null) {
          return Column(
            children: [
              for (Notice notice in notices) _notice(notice),
              const SizedBox(height: 36),
            ],
          );
        } else {
          return Container();
        }
      },
      onLoading: Container(),
    );
  }

  int _compEvent(Event a, Event b) {
    if (a.endsAt == null) {
      return 1;
    }
    if (b.endsAt == null) {
      return 0;
    }
    return a.endsAt!.isBefore(b.endsAt!) ? 1 : 0;
  }

  Widget _buildEvents(List<Event> events) {
    return Column(
      children: events
          .map(
            (event) => Column(
              children: [
                EventItem(title: event.title, description: event.description, expireDate: event.endsAt),
                const SizedBox(height: 36),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget _eventsArea() {
    return eventController.obx(
      (events) {
        if (events!.isEmpty) {
          return Container();
        } else {
          List<Event> previewingEvents = List.from(events!);
          previewingEvents.sort(_compEvent);
          previewingEvents = previewingEvents.sublist(0, min(3, previewingEvents.length));
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.EVENT),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const Divider(color: DPColors.DARK6, height: 1, thickness: 1),
                  const SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          const Text(
                            '이벤트',
                            style: DPTextTheme.SECTION_HEADER,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '${events.length}개',
                            style: DPTextTheme.DESCRIPTION,
                          ),
                        ],
                      ),
                      SvgPicture.asset('asset/images/arrow_right.svg', semanticsLabel: 'arrow_right'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildEvents(previewingEvents),
                ],
              ),
            ),
          );
        }
      },
      onLoading: Container(),
    );
  }

  Widget _topArea() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _logoArea(),
            const SizedBox(height: 36),
            _noticeArea(),
            _eventsArea(),
          ],
        ),
      ),
    );
  }

  Widget _paymentsArea() {
    return Container(
      decoration: const BoxDecoration(
        color: DPColors.DARK6,
      ),
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                SizedBox(width: 32),
                DPSmallCardPayment(title: '국민카드', subtitle: '카드결제', color: Color.fromRGBO(118, 108, 98, 1)),
                SizedBox(width: 12),
                DPSmallCardPayment(title: '페이머니로 결제', subtitle: '잔액 3,600원', color: DPColors.MAIN_THEME),
                SizedBox(width: 12),
                DPSmallCardPayment(title: '쿠폰만 쓰기', color: DPColors.DARK2),
                SizedBox(width: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DPColors.DARK6,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: _topArea(),
                ),
                _paymentsArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DPSmallCardPayment extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color color;
  const DPSmallCardPayment({Key? key, required this.title, required this.color, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 81,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: color,
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          subtitle == null
              ? Container()
              : Column(
                  children: [
                    Text(subtitle!, style: const TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.2, color: Color.fromRGBO(255, 255, 255, 0.4))),
                  ],
                ),
          Text(title, style: const TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 17, height: 1.2, color: Colors.white)),
        ],
      ),
    );
  }
}
