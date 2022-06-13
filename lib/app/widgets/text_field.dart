import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:dimipay/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class DPTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool autofocus;
  final bool isPassword;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;

  const DPTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.maxLength,
    this.textInputType,
    this.onChanged,
    this.textInputAction,
    this.onEditingComplete,
    this.autofocus = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      autofocus: autofocus,
      style: DPTextTheme.REGULAR,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        counterText: "",
        fillColor: DPColors.DARK6,
        filled: true,
        hintStyle: DPTextTheme.DESCRIPTION,
        floatingLabelStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4), fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }
}

class DPTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool autofocus;
  final bool isPassword;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;

  const DPTextFormField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.maxLength,
    this.textInputType,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.onEditingComplete,
    this.autofocus = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      autofocus: autofocus,
      style: DPTextTheme.REGULAR,
      onEditingComplete: onEditingComplete,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        counterText: "",
        fillColor: DPColors.DARK6,
        filled: true,
        hintStyle: DPTextTheme.DESCRIPTION,
        floatingLabelStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4), fontWeight: FontWeight.w500, fontSize: 12),
      ),
      validator: validator,
    );
  }
}
