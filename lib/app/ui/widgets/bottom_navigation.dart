import 'package:dimipay/app/ui/ui_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            label: "",
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("asset/images/qrcode.svg"),
                const SizedBox(width: 6),
                const Text("결제",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ],
            )),
        BottomNavigationBarItem(
            label: "",
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("asset/images/coupon.svg"),
                const SizedBox(width: 6),
                const Text("쿠폰",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ],
            )),
        BottomNavigationBarItem(
          label: "",
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("asset/images/profile.svg"),
              const SizedBox(width: 6),
              const Text("정보",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
