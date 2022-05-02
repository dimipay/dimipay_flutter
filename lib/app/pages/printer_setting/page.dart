import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/pages/printer_setting/widget/file_item.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrinterSettingPage extends StatelessWidget {
  const PrinterSettingPage({Key? key}) : super(key: key);

  _filesArea() {
    return Column(
      children: [
        const PrinterFileItem(fileName: "FaceSign_open_api1125.pdf", time: "30분전"),
        const SizedBox(height: 12),
        const PrinterFileItem(fileName: "FaceSign_open_api1125.pdf", time: "30분전"),
        const SizedBox(height: 12),
        _newFileUpload(),
      ],
    );
  }

  _newFileUpload() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: DPColors.DARK6,
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                SvgPicture.asset("asset/images/add.svg"),
                const SizedBox(width: 6),
                const Text("새 파일 업로드", style: DPTextTheme.DESCRIPTION_IMPORTANT_COLOR),
              ],
            )),
      ),
    );
  }

  //ㅎㅎ 모듈 ㅎㅎ 좋아 ㅎㅎ !! ㅎㅎ
  _price() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("예상 가격 알아보기", style: DPTextTheme.SECTION_HEADER),
        const SizedBox(height: 24),
        const Text("색", style: DPTextTheme.REGULAR_IMPORTANT),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(child: DPMediumTextButton(text: "컬러")),
            SizedBox(width: 12),
            Expanded(child: DPMediumTextButton(text: "흑백", color: DPColors.DARK6, textColor: DPColors.DARK1)),
          ],
        ),
        const SizedBox(height: 24),
        const Text("인쇄면", style: DPTextTheme.REGULAR_IMPORTANT),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(child: DPMediumTextButton(text: "양면", color: DPColors.DARK6, textColor: DPColors.DARK1)),
            SizedBox(width: 12),
            Expanded(child: DPMediumTextButton(text: "단면")),
          ],
        ),
        const SizedBox(height: 24),
        const Text("쪽수", style: DPTextTheme.REGULAR_IMPORTANT),
        const SizedBox(height: 12),
        const Text("- 23장 +", style: DPTextTheme.DESCRIPTION_IMPORTANT),
        const SizedBox(height: 12),
        Slider(
          value: 0,
          onChanged: (newValue) {},
          // activeColor: DPColors.MAIN_THEME,
          thumbColor: DPColors.MAIN_THEME,
          activeColor: DPColors.MAIN_THEME,
          inactiveColor: DPColors.DARK6,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('신관 프린터')),
      body: RefreshIndicator(
        onRefresh: () async {},
        color: DPColors.MAIN_THEME,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const Text("내 문서함", style: DPTextTheme.SECTION_HEADER),
                const SizedBox(height: 8),
                const Text("문서함은 매일 자정 초기화됩니다.", style: DPTextTheme.PAGE_DESCRIPTION),
                const SizedBox(height: 32),
                Row(
                  children: [
                    SvgPicture.asset('asset/images/circled_question.svg'),
                    const SizedBox(width: 12),
                    const Text('신관 프린터는 어떻게 사용하나요?', style: DPTextTheme.DESCRIPTION),
                  ],
                ),
                const SizedBox(height: 32),
                _filesArea(),
                const SizedBox(height: 72),
                _price(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
