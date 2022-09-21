// ignore_for_file: constant_identifier_names

import 'package:dimipay/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

abstract class DPTextTheme {
  static const DECORATIVE = TextStyle(fontFamily: 'NEXON Lv1 Gothic', fontWeight: FontWeight.bold, fontSize: 20, height: 1.3, color: DPColors.DARK1);
  static const HEADER1 = TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 28, height: 1.3, color: DPColors.DARK1);
  static const HEADER2 = TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 24, height: 1.3, color: DPColors.DARK1);
  static const HEADER3 = TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 20, height: 1.3, color: DPColors.DARK1);
  static const PAGE_HEADER = TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 20, height: 1.3, color: DPColors.DARK1);
  static const PAGE_DESCRIPTION = TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.5, color: DPColors.DARK3);
  static const SECTION_HEADER = TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.bold, fontSize: 18, height: 1.3, color: DPColors.DARK1);
  static const REGULAR = TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.3, color: DPColors.DARK1);
  static const READABLE = TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w500, fontSize: 20, height: 1.3, color: DPColors.DARK1);
  static const REGULAR_IMPORTANT = TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w600, fontSize: 16, height: 1.3, color: DPColors.DARK1);
  static const DESCRIPTION = TextStyle(fontFamily: 'Pretendard', fontSize: 14, height: 1.3, color: Color(0xFFABB0B0));
  static const DESCRIPTION_IMPORTANT = TextStyle(fontFamily: 'Pretendard', fontSize: 14, height: 1.3, color: DPColors.DARK1);
  static const DESCRIPTION_IMPORTANT_COLOR = TextStyle(fontFamily: 'Pretendard', fontSize: 16, height: 1.3, color: DPColors.MAIN_THEME);
}
