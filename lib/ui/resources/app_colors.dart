import 'package:flutter/painting.dart';

class AppColors {
  const AppColors._();

  /// Main theme colors - DO NOT USE them directly

  static const Color _primary = Color(0xFFC48A10);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _grey = Color(0xFFCCCCCC);
  static const Color _lightGrey = Color(0xFFEDEDD6);
  static const Color _darkGrey = Color(0xFF5B5C53);
  static const Color _yellow = Color(0xFFE2C916);
  static const Color _red = Color(0xFFD31717);
  static const Color _black = Color(0xFF000000);

  /// END Theme colors

  static Color get primary => _primary;

  static Color get white => _white;

  static Color get shadow => _grey.withOpacity(0.5);

  static Color get textfieldColor => _lightGrey;

  static Color get buttonColor => _yellow;

  static Color get errorColor => _red;

  static Color get itemListBorder => _grey;

  static Color get textColorGrey => _darkGrey;

  static Color get black => _black;
}
