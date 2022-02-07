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
            activeColor: const Color.fromRGBO(46, 164, 171, 1),
          ),
        ),
        label == null
            ? Container()
            : Row(
                children: [
                  const SizedBox(width: 4),
                  Text(
                    label!,
                    style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
                  ),
                ],
              ),
      ],
    );
  }
}
