import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class DPCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;
  final String? label;
  const DPCheckbox({Key? key, required this.value, required this.onChanged, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            splashRadius: 10,
            activeColor: DPColors.MAIN_THEME,
          ),
        ),
        const SizedBox(width: 4),
        label == null
            ? Container()
            : Row(
                children: [
                  const SizedBox(width: 4),
                  Text(
                    label!,
                    style: DPTextTheme.DESCRIPTION,
                  ),
                ],
              ),
      ],
    );
  }
}
