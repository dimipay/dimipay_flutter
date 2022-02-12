import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/routes/routes.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditCardNamePage extends StatelessWidget {
  final FocusNode textFieldFocusNode = FocusNode();
  EditCardNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '카드의 이름을 입력해주세요',
                    style: DPTextTheme.SECTION_HEADER,
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      textFieldFocusNode.requestFocus();
                    },
                    child: Container(
                      width: 160,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF766C62),
                        boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.12), offset: Offset(0, 4), blurRadius: 72)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('2158', style: TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.5))),
                          const SizedBox(height: 4),
                          TextField(
                            autofocus: true,
                            focusNode: textFieldFocusNode,
                            cursorColor: Colors.white,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                              hintText: '카드 이름',
                              hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 0.5)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '다음에 설정에서 바꿀게요',
                  style: DPTextTheme.DESCRIPTION,
                ),
                const SizedBox(width: 6),
                SvgPicture.asset('asset/images/arrow_right_6.svg'),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DPMediumTextButton(
                text: '다음',
                width: double.infinity,
                onTap: () {
                  Get.offNamed(Routes.CARDFIN);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
