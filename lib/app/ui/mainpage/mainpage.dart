import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/ui/widgets/bottom_navigation.dart';
import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:dimipay/app/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Dimi Pay",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.NOTIFICATION);
                    },
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Color(0xffe0e0e0),
                      child: Icon(
                        FeatherIcons.bell,
                        color: Color(0xff404040),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ACCOUNTINFO);
                    },
                    child: const CircleAvatar(
                      radius: 24,
                      //backgroundImage: AssetImage("asset/images/Image11.png"),
                      backgroundImage: NetworkImage("https://flyclipart.com/thumb2/boss-circle-man-person-profile-staff-user-icon-133441.png"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            //const CardPage(hasCard: true)
            Coupon()
          ],
        ),
      ),
    );
  }
}

class CardPage extends StatelessWidget {
  final bool hasCard;
  final String text;
  const CardPage({Key? key, this.hasCard = false, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (hasCard == false) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * (400 / 844),
            width: size.width * (250 / 390),
            child: const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffe0e0e0),
                child: Icon(
                  FeatherIcons.plus,
                  color: Color(0xff404040),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "카드를 추가하세요",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
    }

    return Column(
      children: const [
        DPRealCard(),
        SizedBox(
          height: 20,
        ),
        Text(
          "두번 탭 하여 결제",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}

class Coupon extends StatelessWidget {
  const Coupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.COUPONLIST);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset("asset/images/coupon_vertical.svg"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Coupon", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), Text("쿠폰이 5개 있어요?")],
          )
        ],
      ),
    );
  }
}

class DPRealCard extends StatelessWidget {
  const DPRealCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),

        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3, 2),
            blurRadius: 22,
          )
        ], // 수정 필요
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("국민카드", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("10/26", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              width: size.width * (25 / 390),
            ),
            RotatedBox(
              quarterTurns: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("1234", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("1234", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("1234", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("1234", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              width: size.width * (57 / 390),
            ),
            Expanded(child: SvgPicture.asset("asset/images/ic_chip.svg")),
          ],
        ),
      ),
      height: size.height * (400 / 844),
      width: size.width * (250 / 390),
    );
  }
}
