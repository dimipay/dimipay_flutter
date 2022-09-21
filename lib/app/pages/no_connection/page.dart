import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/widgets/card.dart';
import 'package:dimipay/app/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SvgPicture.asset("asset/images/logo2.svg", width: 40), const Text('DIMIPAY', style: TextStyle(color: Color.fromRGBO(46, 164, 171, 1), fontFamily: 'Montserrat', fontSize: 22)), const SizedBox(height: 48), const DPPaymentCard(color: DPColors.MAIN_THEME, cardName: "WIFI ISSUE", cardNumber: "WIFI", isHorizontal: false, width: 153), const SizedBox(height: 32), const Text("인터넷 연결이 끊겼습니다.", style: TextStyle(color: DPColors.DARK1, fontFamily: 'NEXON Lv1 Gothic', fontSize: 20, fontWeight: FontWeight.w700))],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
