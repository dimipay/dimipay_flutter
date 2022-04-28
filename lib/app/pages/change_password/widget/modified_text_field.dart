import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ModifiedDPTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool autofocus;
  final bool isPassword;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Function(String s)? onSaved;
  final Function(String s)? onValidate;
  final Function(String s)? onChanged;

  const ModifiedDPTextField({Key? key, this.label, this.hintText, this.controller, this.maxLength, this.textInputType, this.autofocus = false, this.isPassword = false, this.onChanged, this.onSaved, this.onValidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        onSaved: (v) => onSaved!(v!),
        validator: (v) => onValidate!(v!),
        onChanged: (v) => onChanged!(v),
        obscureText: isPassword,
        enableSuggestions: !isPassword,
        autocorrect: !isPassword,
        autofocus: autofocus,
        style: DPTextTheme.REGULAR,
        cursorColor: Colors.black,
        keyboardType: textInputType,
        maxLength: maxLength,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          border: InputBorder.none,
          counterText: "",
          fillColor: DPColors.DARK6,
          filled: true,
          hintStyle: DPTextTheme.DESCRIPTION,
          floatingLabelStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4), fontWeight: FontWeight.w500, fontSize: 12),
        ),
      ),
    );
  }
}
