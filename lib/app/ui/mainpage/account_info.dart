import 'package:dimipay/app/ui/ui_asset.dart';
import 'package:dimipay/app/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: // Figma Flutter Generator Frame251Widget - FRAME - HORIZONTAL
            SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Profile(),
            SizedBox(
              height: 36,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DPCard(
                    width: 174,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("asset/images/card.svg"),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "결제수단",
                          style: TextStyle(color: mainColor, fontSize: 16),
                        )
                      ],
                    )),
                SizedBox(
                  width: 12,
                ),
                DPCard(
                    width: 174,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("asset/images/inquiry.svg"),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "문의",
                          style: TextStyle(color: mainColor, fontSize: 16),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            DPCard(
              child: PaymentHistory(),
              width: 361,
              height: 364,
            )
          ],
        ),
      ),
    ));
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48,
          width: 48,
          child: Image.asset('asset/images/Image11.png'),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "박정한",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "디미고 계정으로 로그인 됨",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14),
            ),
          ],
        )
      ],
    );
  }
}

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "결제 내역",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 246,
              ),
              SvgPicture.asset("asset/images/arrow_right.svg"),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          PayLog(date: "3월 14일", log: [
            ["빨간 돼지바", "17시 40분", "3,500"],
            ["빨간 돼지바", "17시 40분", "3,500"]
          ]),
          SizedBox(
            height: 24,
          ),
          PayLog(date: "3월 14일", log: [
            ["빨간 돼지바", "17시 40분", "3,500"],
            ["빨간 돼지바", "17시 40분", "3,500"]
          ]),
        ],
      ),
    );
  }
}

class PayLog extends StatelessWidget {
  final String? date;
  final List<List<String>>? log;
  const PayLog({Key? key, this.date, this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date!,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 47.0 * log!.length,
          child: ListView.builder(
            itemCount: log!.length,
            itemBuilder: (context, int index) {
              return Row(
                children: [
                  Container(
                    width: 175,
                    height: 44,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(log![index][0],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 4,
                          ),
                          Text("${log![index][2]}원",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal)),
                        ]),
                  ),
                  SizedBox(
                    width: 81,
                  ),
                  Text(log![index][1], style: TextStyle(fontSize: 14)),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
