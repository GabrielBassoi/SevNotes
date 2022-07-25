import 'package:flutter/material.dart';

import 'theme.dart';

class Themes {
  static MyTheme light = MyTheme(
    layout: const Color(0xFFFFFFFF),
    background: const Color(0xFFA6A6A6),
    text: const Color(0xFF000000),
    date: const Color(0xFF000000),
    clockDate: const Color(0xFF000000),
    primary: const Color(0xFF000000),
  );

  static MyTheme dark = MyTheme(
    layout: const Color(0xFF2E2E2E),
    background: const Color(0xFF3C3C3C),
    text: const Color(0xFFFFFFFF),
    date: const Color(0xFF939393),
    clockDate: const Color(0xFFFFFFFF),
    primary: const Color(0xFFFFFFFF),
  );

  static MyTheme darkplus = MyTheme(
    layout: const Color(0xFF1D1D1D),
    background: const Color(0xFF000000),
    text: const Color(0xFFFFFFFF),
    date: const Color(0xFF939393),
    clockDate: const Color(0xFFFFFFFF),
    primary: const Color(0xFFFFFFFF),
  );

  static MyTheme greenBlue = MyTheme(
    layout: const Color(0xFF2B3138),
    background: const Color(0xFF202329),
    text: const Color(0xFFFFFFFF),
    date: const Color(0xFF939393),
    clockDate: const Color(0xFF93B296),
    primary: const Color(0xFF03FF1C),
  );

  static MyTheme grayYellow = MyTheme(
    layout: const Color(0xFF2E2E2E),
    background: const Color(0xFF1F1F1F),
    text: const Color(0xFFFFFFFF),
    date: const Color(0xFF8B7C3D),
    clockDate: const Color(0xFF8B7C3D),
    primary: const Color(0xFFFFD60A),
  );

  static MyTheme grayOrange = MyTheme(
    layout: const Color(0xFF2E2E2E),
    background: const Color(0xFF1F1F1F),
    text: const Color(0xFFFFFFFF),
    date: const Color(0xFF8D6B4F),
    clockDate: const Color(0xFF8D6B4F),
    primary: const Color(0xFFFF7A00),
  );
}
