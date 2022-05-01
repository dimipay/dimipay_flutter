import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/printer_setting/widget/file_item.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrinterSettingPage extends StatelessWidget {
  const PrinterSettingPage({Key? key}) : super(key: key);

  _testFiles() {
    return Column(
      children: const [
        PrinterFileItem(fileName: "FaceSign_open_api1125.pdf", time: "30분전"),
        SizedBox(height: 6),
        PrinterFileItem(fileName: "FaceSign_open_api1125.pdf", time: "30분전"),
      ],
    );
  }

  _newFileUpload() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: DPColors.DARK6,
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SvgPicture.asset("asset/images/add.svg"),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
                    "새 파일 업로드하기",
                    style: DPTextTheme.DESCRIPTION_IMPORTANT_COLOR,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  //ㅎㅎ 모듈 ㅎㅎ 좋아 ㅎㅎ !! ㅎㅎ
  _price() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("예상 가격 알아보기", style: DPTextTheme.SECTION_HEADER),
        const SizedBox(
          height: 24,
        ),
        const Text("색", style: DPTextTheme.REGULAR_IMPORTANT),
        const SizedBox(height: 12),
        Row(
          children: const [
            Flexible(child: DPMediumTextButton(text: "컬러")),
            SizedBox(width: 12),
            Flexible(child: DPMediumTextButton(text: "흑백")),
          ],
        ),
        const SizedBox(height: 24),
        const Text("인쇄면", style: DPTextTheme.REGULAR_IMPORTANT),
        const SizedBox(height: 12),
        Row(
          children: const [
            Flexible(child: DPMediumTextButton(text: "양면")),
            SizedBox(width: 12),
            Flexible(child: DPMediumTextButton(text: "단면")),
          ],
        ),
        const SizedBox(height: 24),
        const Text("쪽수", style: DPTextTheme.REGULAR_IMPORTANT),
        const SizedBox(height: 12),
        const Text(
          "- 23장 +",
          style: DPTextTheme.DESCRIPTION_IMPORTANT,
        ),
        Slider(
          value: 0,
          onChanged: (newValue) {},
          activeColor: DPColors.MAIN_THEME,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('신관 프린터', style: DPTextTheme.PAGE_HEADER)),
      body: RefreshIndicator(
        onRefresh: () async {},
        color: DPColors.MAIN_THEME,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                const Text("내 문서함", style: DPTextTheme.SECTION_HEADER),
                const SizedBox(height: 8),
                const Text("문서함은 매일 자정 초기화됩니다.", style: DPTextTheme.PAGE_DESCRIPTION),
                const SizedBox(height: 26),
                Row(
                  children: [
                    SvgPicture.asset('asset/images/circled_question.svg'),
                    const SizedBox(width: 12),
                    const Text('신관 프린터는 어떻게 사용하나요?', style: DPTextTheme.DESCRIPTION),
                  ],
                ),
                const SizedBox(height: 26),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    child: Column(
                      children: [_testFiles(), _newFileUpload(), _price()],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
