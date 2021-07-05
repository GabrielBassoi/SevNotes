import 'package:flutter/material.dart';

import 'theme.dart';

class Themes {
  static MyTheme light = MyTheme(
    layout: Color(0xFFFFFFFF),
    background: Color(0xFFA6A6A6),
    text: Color(0xFF000000),
    date: Color(0xFF000000),
    clockDate: Color(0xFF000000),
    primary: Color(0xFF000000),
  );

  static MyTheme dark = MyTheme(
    layout: Color(0xFF2E2E2E),
    background: Color(0xFF3C3C3C),
    text: Color(0xFFFFFFFF),
    date: Color(0xFF939393),
    clockDate: Color(0xFFFFFFFF),
    primary: Color(0xFFFFFFFF),
  );

  static MyTheme darkplus = MyTheme(
    layout: Color(0xFF1D1D1D),
    background: Color(0xFF000000),
    text: Color(0xFFFFFFFF),
    date: Color(0xFF939393),
    clockDate: Color(0xFFFFFFFF),
    primary: Color(0xFFFFFFFF),
  );

  static MyTheme greenBlue = MyTheme(
    layout: Color(0xFF2B3138),
    background: Color(0xFF202329),
    text: Color(0xFFFFFFFF),
    date: Color(0xFF939393),
    clockDate: Color(0xFF93B296),
    primary: Color(0xFF03FF1C),
  );

  static MyTheme grayYellow = MyTheme(
    layout: Color(0xFF2E2E2E),
    background: Color(0xFF1F1F1F),
    text: Color(0xFFFFFFFF),
    date: Color(0xFF8B7C3D),
    clockDate: Color(0xFF8B7C3D),
    primary: Color(0xFFFFD60A),
  );

  static MyTheme grayOrange = MyTheme(
    layout: Color(0xFF2E2E2E),
    background: Color(0xFF1F1F1F),
    text: Color(0xFFFFFFFF),
    date: Color(0xFF8D6B4F),
    clockDate: Color(0xFF8D6B4F),
    primary: Color(0xFFFF7A00),
  );
}
