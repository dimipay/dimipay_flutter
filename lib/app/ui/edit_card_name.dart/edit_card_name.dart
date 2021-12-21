import 'package:dimipay/app/ui/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditCardNamePage extends StatelessWidget {
  const EditCardNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Card Name Page')),
      body: DPPaymentCard(
        color: const Color(0xFF766C62),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('개돼지', style: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 4),
                Text('2158', style: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.6))),
              ],
            ),
            SvgPicture.asset('asset/images/kb_logo.svg'),
          ],
        ),
      ),
    );
  }
}
