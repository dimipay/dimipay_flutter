import 'package:dimipay/app/ui/widgets/button.dart';
import 'package:dimipay/app/ui/widgets/card.dart';
import 'package:dimipay/app/ui/widgets/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ManageMethodPage extends StatefulWidget {
  const ManageMethodPage({Key? key}) : super(key: key);

  @override
  State<ManageMethodPage> createState() => _ManageMethodPageState();
}

class _ManageMethodPageState extends State<ManageMethodPage> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제 수단'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            DPCard(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('페이머니', style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.4))),
                      DPCheckbox(
                        label: '기본 결제수단으로 설정',
                        value: ischecked,
                        onChanged: (value) {
                          setState(() {
                            ischecked = !ischecked;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '2,300원',
                        style: TextStyle(
                          fontFamily: 'NEXON Lv1 Gothic',
                          fontSize: 20,
                          color: Color.fromRGBO(46, 164, 171, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DPSmallButton(
                        child: Row(
                          children: [
                            SvgPicture.asset('asset/images/charge.svg'),
                            const SizedBox(width: 6),
                            const Text(
                              '충전',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            DPCard(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('실물 카드', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      DPCheckbox(
                        label: '기본 결제수단으로 설정',
                        value: ischecked,
                        onChanged: (value) {
                          setState(() {
                            ischecked = !ischecked;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const DPRealCard(),
                  const SizedBox(height: 12),
                  const Text('기존에 등록된 카드를 지워야 다른 카드를 등록할 수 있어요', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            DPCard(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('간편결제 서비스와 연결', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        SizedBox(height: 6),
                        Text('카카오페이, 네이버페이, 토스결제와 연결할 수 있어요', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4))),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  SvgPicture.asset('asset/images/arrow_right.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DPRealCard extends StatelessWidget {
  const DPRealCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(118, 108, 98, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('카드결제', style: TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.4))),
              const SizedBox(height: 4),
              Row(
                children: [
                  SvgPicture.asset('asset/images/edit.svg'),
                  const SizedBox(width: 4),
                  const Text('국민카드', style: TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          SvgPicture.asset('asset/images/delete.svg'),
        ],
      ),
    );
  }
}
