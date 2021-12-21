import 'package:dimipay/app/ui/ui_asset.dart';
import 'package:dimipay/app/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const Profile(),
              const SizedBox(height: 36),
              Row(
                children: [
                  Flexible(
                    child: DPCard(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("asset/images/card.svg"),
                          const SizedBox(width: 8),
                          const Text("결제수단", style: TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: DPCard(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("asset/images/inquiry.svg"),
                          const SizedBox(width: 8),
                          const Text("문의", style: TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const DPCard(child: PaymentHistory())
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(backgroundImage: AssetImage('asset/images/Image11.png'), radius: 24),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("박정한", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            Text("디미고 계정으로 로그인 됨", style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4))),
          ],
        ),
      ],
    );
  }
}

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("결제 내역", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SvgPicture.asset("asset/images/vector_2.svg"),
            ],
          ),
          const SizedBox(height: 24),
          const PayLog(date: "3월 14일", log: [
            ["빨간 돼지바", "17시 40분", "￦3,500"],
            ["빨간 돼지바", "17시 40분", "￦3,500"]
          ]),
          const SizedBox(
            height: 24,
          ),
          const PayLog(date: "3월 14일", log: [
            ["빨간 돼지바", "17시 40분", "￦3,500"],
            ["빨간 돼지바", "17시 40분", "￦3,500"]
          ]),
        ],
      ),
    );
  }
}

class PayLog extends StatelessWidget {
  final String date;
  final List<List<String>> log;
  const PayLog({Key? key, required this.date, required this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.4)),
        ),
        const SizedBox(height: 12),
        Builder(
          builder: (context) {
            List<Widget> children = [];
            for (int index = 0; index < log.length; index++) {
              children.add(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(log[index][0], style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 4),
                        Text("${log[index][2]}원", style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6))),
                      ],
                    ),
                    Text(log[index][1], style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4))),
                  ],
                ),
              );
              if (index != log.length - 1) {
                children.add(const SizedBox(height: 12));
              }
            }
            return Column(children: children);
          },
        ),
      ],
    );
  }
}
