import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFF1A428A);
  static const Color primarySoft = Color(0xFF557BBF);
  static const Color highlight = Color(0xFF325AA3);
  static const Color secondary = Color(0xFFE81F76);
  static const Color border = Color(0xFF3764B4);
  static const Color textfield = Color(0xFF0F3374);

  
}

class AppStyle {
  static const titleStyle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 15.0,
    color: Colors.white,
  );

  static const subtitleStyle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 13.0,
    color: Colors.grey,
  );

  static const headerStyle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
