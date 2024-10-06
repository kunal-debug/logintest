import 'package:flutter/material.dart';

class AppTextStyle {
  static const double _smallFont = 12;
  static const double _mediumFont = 14;
  static const double _largeFont = 16;
  static const double _extraLarge = 18;
  static const double _extraExtraLarge = 20;

  // Title
  static TextStyle titleExtraExtraLarge = const TextStyle(
    fontSize: _extraExtraLarge,
  );
  static TextStyle titleExtraLarge = const TextStyle(
    fontSize: _extraLarge,
  );
  static TextStyle titleLarge = const TextStyle(
    fontSize: _largeFont,
  );
  static TextStyle titleMedium = const TextStyle(
    fontSize: _mediumFont,
  );
  static TextStyle titleSmall = const TextStyle(
    fontSize: _smallFont,
  );
}
