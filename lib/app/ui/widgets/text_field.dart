import 'package:flutter/material.dart';

class DPTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool autofocus;
  const DPTextField(
      {Key? key, this.label, this.hintText, this.autofocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: TextField(
        autofocus: autofocus,
        style: const TextStyle(fontSize: 18),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          border: InputBorder.none,
          fillColor: const Color(0xFFF6F6F6),
          filled: true,
          hintStyle: const TextStyle(
              fontSize: 18, color: Color.fromRGBO(0, 0, 0, 0.4)),
          floatingLabelStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.6),
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
      ),
    );
  }
}
