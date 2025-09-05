import 'package:flutter/material.dart';

abstract class ColorManager {
  static const Color primaryColor = Color(0xFF8C6149);
  static const Color appBarColor = Color(0xFFEAA75E);
  static const Color primaryDark = Color(0xFF06004F);

  static const Color darkGrey = Color(0xff525252);
  static const Color green = Color(0XFF8BC83F);
  static const Color grey = Color(0xCBBCB3BF);
  static const Color lightGrey = Color.fromARGB(255, 119, 116, 116);
  static const Color black = Color(0xff000000);
  static const Color containerGray = Color.fromARGB(255, 31, 6, 6);
  static const Color editProfileFieldColor = Color(0x1018280d);

  static const Color starRateColor = Color(0xFFB8860B);
  static const Color darkBlue = Color(0xff06004F);
  static const Color yellow = Color(0xFFFDD835);

  static const Color greyLabelText = Color.fromARGB(255, 72, 74, 90);
  static const Color greyTextFormField = Color(0xFFD1D5DB);
  static const Color greyCardSignUp = Color(0xDFE0E200);
  static const Color grey2 = Color(0xFF2D231C);
  static const Color backgroundGrey = Color(0xFFEAA75E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xffe61f34);
  static const Color backgroundContainerProfile = Color(0xFFFFF6E9);
  static const Color iconProfileColor = Color(0xFF704116);
  static const Color boxProfileColor = Color(0xFFE7BABD);
  static const Color backgroundEditBoxColor = Color(0xFFFEE7BA);
  static const homeBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF4B3226),
      Color.fromARGB(255, 59, 55, 53),
      Color.fromARGB(255, 31, 29, 29),
    ],
  );
  static const productBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 31, 29, 29),
      Color(0xFF4B3226),
      Color.fromARGB(255, 59, 55, 53),
    ],
  );
}
