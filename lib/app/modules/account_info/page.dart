import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/data/services/auth/service.dart';
import 'package:dimipay/app/modules/account_info/controller.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountInfoPage extends StatelessWidget {
  AccountInfoPage({Key? key}) : super(key: key);
  final UserController userController = Get.find<UserController>();

  Widget _userName() {
    return userController.obx(
      (state) => Text(state!.value!.name, style: DPTextTheme.REGULAR_IMPORTANT),
      onLoading: const Text('loading...', style: DPTextTheme.REGULAR_IMPORTANT),
    );
  }

  Widget _userId() {
    return userController.obx(
      (state) => Text('@' + state!.value!.accountName, style: DPTextTheme.DESCRIPTION),
      onLoading: const Text('loading...', style: DPTextTheme.DESCRIPTION),
    );
  }

  Widget _profileArea() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(backgroundImage: AssetImage('asset/images/Image11.png'), radius: 24),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userName(),
            const SizedBox(height: 4),
            _userId(),
          ],
        ),
      ],
    );
  }

  Widget _topArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _profileArea(),
        const SizedBox(height: 36),
        Row(
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.MANAGEMETHOD);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: DPColors.DARK6,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("asset/images/card.svg"),
                      const SizedBox(width: 8),
                      const Text(
                        "결제수단",
                        style: TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w600, fontSize: 16, height: 1.2, color: DPColors.MAIN_THEME),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: DPColors.DARK6,
                ),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("asset/images/inquiry.svg"),
                    const SizedBox(width: 8),
                    const Text(
                      "문의",
                      style: TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w600, fontSize: 16, height: 1.2, color: DPColors.MAIN_THEME),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 36),
      ],
    );
  }

  Widget _transactionHistoryArea() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.TRANSACTIONHISTORY);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('결제기록', style: DPTextTheme.SECTION_HEADER),
                SvgPicture.asset('asset/images/arrow_right.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                Get.find<AuthService>().logout();
              }
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'logout',
                child: Text('로그아웃'),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: DPColors.MAIN_THEME,
          onRefresh: userController.refreshData,
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _topArea(),
                  const Divider(color: DPColors.DARK6, height: 1, thickness: 1),
                  _transactionHistoryArea(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
