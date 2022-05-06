import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckButton extends StatelessWidget {
  const CheckButton({
    Key? key,
    required this.buttonName,
    required this.isTwo,
    this.onTap,
  }) : super(key: key);
  final String buttonName;
  final Function()? onTap;
  final bool isTwo;

  @override
  Widget build(BuildContext context) {
    if (isTwo) {
      String otherButtonName = (buttonName == "설정하기") ? "건너뛰기" : "취소";
      return Row(children: [
        Expanded(
            child: DPMediumTextButton(
          color: DPColors.DARK4,
          text: otherButtonName,
          onTap: () {
            Get.back();
          },
        )),
        const SizedBox(width: 12),
        Expanded(
            child: DPMediumTextButton(
          text: buttonName,
          onTap: onTap,
        ))
      ]);
    } else {
      return DPMediumTextButton(text: buttonName, onTap: onTap);
    }
  }
}

class DPBaseDialog extends StatelessWidget {
  const DPBaseDialog({Key? key, required this.title, required this.content, required this.button}) : super(key: key);
  final String title;
  final Widget content;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: DPTextTheme.READABLE,
              ),
              const SizedBox(height: 12),
              content,
              const SizedBox(height: 24),
              button,
            ],
          ),
        ),
      ),
    );
  }
}

class DPTextDialog extends StatelessWidget {
  const DPTextDialog({Key? key, required this.title, required this.content, this.onTap, this.buttonName = "설정하기", this.isTwo = false}) : super(key: key);

  final String title;
  final String content;

  final Function()? onTap;
  final String buttonName;

  final bool isTwo;

  @override
  Widget build(BuildContext context) {
    return DPBaseDialog(
        title: title,
        content: Text(content, style: DPTextTheme.DESCRIPTION),
        button: CheckButton(
          buttonName: buttonName,
          onTap: onTap,
          isTwo: isTwo,
        ));
  }
}
