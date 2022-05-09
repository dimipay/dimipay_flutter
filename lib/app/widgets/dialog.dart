import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:dimipay/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DPDialogAction {
  final String title;
  final void Function()? onTap;
  final bool isHighlighted;
  DPDialogAction({required this.title, this.onTap, this.isHighlighted = false});
}

class DPDialogActionButton extends StatelessWidget {
  const DPDialogActionButton(this.action, {Key? key}) : super(key: key);
  final DPDialogAction action;

  @override
  Widget build(BuildContext context) {
    return DPMediumTextButton(
      text: action.title,
      onTap: action.onTap,
      color: action.isHighlighted ? DPColors.MAIN_THEME : DPColors.DARK4,
    );
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

class DPDialog extends StatelessWidget {
  const DPDialog({Key? key, required this.title, required this.content, required this.actions}) : super(key: key);

  final String title;
  final String content;

  final List<DPDialogAction> actions;

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
              Text(content, style: DPTextTheme.DESCRIPTION),
              const SizedBox(height: 12),
              for (var action in actions)
                Column(
                  children: [
                    const SizedBox(height: 12),
                    DPDialogActionButton(action),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
