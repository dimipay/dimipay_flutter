import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/modules/account_info/page.dart';
import 'package:dimipay/app/modules/coupon_list/page.dart';
import 'package:dimipay/app/modules/home/page.dart';
import 'package:dimipay/app/modules/main/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({Key? key}) : super(key: key);

  BottomNavigationBarItem _bottomNavigationBarItem(String iconPath, String text) {
    return BottomNavigationBarItem(
      label: "",
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: DPColors.MAIN_THEME, fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.bottomNavBarIndex.value == 0) {
          return const HomePage();
        } else if (controller.bottomNavBarIndex.value == 1) {
          return const CouponListPage();
        } else if (controller.bottomNavBarIndex.value == 2) {
          return const AccountInfoPage();
        }
        return Container();
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DPColors.DARK6,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          controller.bottomNavBarIndex.value = index;
        },
        items: [
          _bottomNavigationBarItem("asset/images/qrcode.svg", "결제"),
          _bottomNavigationBarItem("asset/images/coupon.svg", "쿠폰"),
          _bottomNavigationBarItem("asset/images/profile.svg", "정보"),
        ],
      ),
    );
  }
}
