import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const Color black = Color(0xFF000000);
  static const Color white = Colors.white;
  static const Color lightGreenLogo = Color(0xFF6AD9AC);
  static const Color accent = Color(0xFF19C4EA);
  static const Color bg = Color(0xFFD9D9D9);
  static Color iconText = Colors.black.withOpacity(0.7);
  static const Color highlight = Color(0xFFF3E3DA);
  
  static const Color textColor1 = Color(0xFFFFFFFF);
  static Color textColor2 = const Color(0xffffffff).withOpacity(0.56);
  static Color textColor3 = const Color(0xFF000718).withOpacity(0.5);
  static Color textColor4 = const Color(0xff000000);

  static getPrimaryColor(int num) => Color(int.parse('0x${num}00845A'));

  static PrimaryColor primaryLight = const PrimaryColor(
    0xFF00845A,
    <int, Color>{
      100: Color(0xFF00845A),
      50: Color(0xFFF2FDF5),
    },
  );

  static BaseColor baseLight = BaseColor(
    0xFF16A249,
    <int, Color>{
      100: Colors.white,
      50: const Color(0xFFF4F4F4),
      80: Colors.white.withOpacity(.8),
      40: Colors.white.withOpacity(.4),
      20: Colors.white.withOpacity(.2),
      60: Colors.white.withOpacity(.6),
    },
  );

  static TextColor textColor = TextColor();
}

class BaseColor extends ColorSwatch<int> {
  const BaseColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;

  Color get shade40 => this[40]!;

  Color get shade80 => this[80]!;

  Color get shade20 => this[20]!;

  Color get shade60 => this[60]!;
}

class PrimaryColor extends ColorSwatch<int> {
  const PrimaryColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;
}

class TextColor extends ColorSwatch<int> {
  TextColor()
      : super(
          0xFF332f2e,
          <int, Color>{
            1: const Color(0xFF000000),
            2: const Color(0xFF000000),
            3: const Color(0xFF000000),
            4: const Color(0xFF000000),
            5: const Color(0x0fffffff).withOpacity(0.56),
            6: const Color(0xFF000000),
          },
        );

  Color get shade1 => this[1]!;
  Color get shade2 => this[2]!;
  Color get shade3 => this[3]!;
  Color get shade4 => this[4]!;
  Color get shade5 => this[5]!;
  Color get shade6 => this[6]!;
}