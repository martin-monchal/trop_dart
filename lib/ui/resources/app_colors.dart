import 'package:flutter/painting.dart';

class AppColors {
  const AppColors._();

  /// Main theme colors - DO NOT USE them directly

  static const Color _primary = Color(0xFFC48A10);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _grey = Color(0xFFCCCCCC);

  /// END Theme colors

  static Color get primary => _primary;

  static Color get white => _white;

  static Color get shadow => _grey.withOpacity(0.5);
}
