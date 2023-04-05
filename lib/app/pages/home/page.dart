import 'dart:math';
import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/data/modules/event/model.dart';
import 'package:dimipay/app/data/modules/notice/model.dart';
import 'package:dimipay/app/data/modules/payment_method/model.dart';
import 'package:dimipay/app/pages/home/controller.dart';
import 'package:dimipay/app/pages/home/widget/event_item.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upgrader/upgrader.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  Widget _logoArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('DIMIPAY', style: TextStyle(color: Color.fromRGBO(46, 164, 171, 1), fontFamily: 'Montserrat', fontSize: 26)),
        Row(
          children: [
            DPIconButton(
              'asset/images/profile.svg',
              onTap: () async {
                Get.toNamed(Routes.USER);
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _buildNotice() {
    return Obx(
      () {
        List<Notice>? notices = controller.noticeController.notices;
        if (notices != null) {
          return Column(
            children: [
              for (Notice notice in notices)
                Row(
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
                    )
                  ],
                )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _noticeArea() {
    return controller.noticeController.obx(
      (_) => _buildNotice(),
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

  Widget _buildEvents() {
    return Obx(() {
      List<Event> events = controller.eventController.events!;
      if (events.isEmpty) {
        return GestureDetector(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: const [
                        Text(
                          '이벤트',
                          style: DPTextTheme.SECTION_HEADER,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('asset/images/no_event.svg', semanticsLabel: 'no_event'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '진행 중인 이벤트가 없어요!',
                        style: DPTextTheme.DESCRIPTION,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        List<Event> previewingEvents = List.from(events);
        previewingEvents.sort(_compEvent);
        previewingEvents = previewingEvents.sublist(0, min(3, previewingEvents.length));
        return GestureDetector(
          onTap: () => Get.toNamed(Routes.EVENT),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
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
                Column(
                  children: previewingEvents
                      .map((event) => Column(children: [
                            EventItem(title: event.title, description: event.description, expireDate: event.endsAt),
                          ]))
                      .toList(),
                )
              ],
            ),
          ),
        );
      }
    });
  }

  Widget _eventsArea() {
    return controller.eventController.obx(
      (_) => _buildEvents(),
      onLoading: Container(),
    );
  }

  Widget _topDivider() {
    return Obx(
      () {
        if (controller.noticeController.notices?.isNotEmpty == true) {
          return Column(
            children: const [
              SizedBox(height: 36),
              Divider(color: DPColors.DARK6, height: 1, thickness: 1),
              SizedBox(height: 36),
            ],
          );
        } else {
          return Container();
        }
      },
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
            _topDivider(),
            _eventsArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Obx(
      () => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 32, height: 81),
            Row(
              children: [
                for (PaymentMethod paymentMethod in controller.paymentMethodController.paymentMethods!)
                  Row(
                    children: [
                      DPSmallCardPayment(
                        subtitle: '카드결제',
                        title: paymentMethod.name ?? '',
                        color: paymentMethod.color?.isEmpty ?? true ? DPColors.MAIN_THEME : Color(int.parse('FF${paymentMethod.color}', radix: 16)),
                        onTap: () {
                          Get.toNamed(Routes.PAY, arguments: paymentMethod);
                        },
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
              ],
            ),
            const SizedBox(width: 20),
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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: SizedBox(
        height: 81,
        child: controller.paymentMethodController.obx(
          (_) => _buildPaymentMethods(),
          onLoading: Container(),
        ),
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
          body: UpgradeAlert(
            upgrader: controller.upgradeService.upgrader,
            child: SafeArea(
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
      ),
    );
  }
}

class DPSmallCardPayment extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color color;
  final void Function()? onTap;
  const DPSmallCardPayment({Key? key, required this.title, required this.color, this.subtitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 81,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: color,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            subtitle == null
                ? Container()
                : Column(
                    children: [
                      Text(subtitle!, style: const TextStyle(fontFamily: 'Pretendard', fontSize: 14, height: 1.2, color: Color.fromRGBO(255, 255, 255, 0.4), letterSpacing: -0.4)),
                    ],
                  ),
            Text(title, style: const TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w600, fontSize: 18, height: 1.2, color: Colors.white, letterSpacing: -0.4)),
          ],
        ),
      ),
    );
  }
}
