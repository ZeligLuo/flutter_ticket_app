import 'package:flutter/material.dart';

Color primary = const Color(0xFF687daf);

class AppStyles {
  static Color primaryColor = primary;
  static Color bgColor = Color(0xFFeeedf2);
  static Color textColor = Color(0xFF3b3b3b);
  static Color ticketBlue = Color(0xFF526799);
  static Color ticketOrange = Color(0xFFF37B67);
  static Color kakiColor = Color(0xFFD2BDB6);
  static Color planeColor = Color(0xFFBFC2DF);
  static Color findTicketsColor = Color(0xD91130CE);
  static Color circleColor = Color(0xFF189999);
  static Color ticketWhite = Color(0XFFFFFFFF);
  static Color dotColor = Color(0xFF8ACCF7);
  static Color planeColor2 = Color(0xFFBACCF7);
  static Color profileLocationColor = Color(0xFFFEF4F3);
  static Color profileTextColor = Color(0xFF526799);

  static TextStyle textStyle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppStyles.textColor
  );
  static TextStyle headlineStyle1 = TextStyle(
      fontSize: 26, fontWeight: FontWeight.bold, color: AppStyles.textColor
  );
  static TextStyle headlineStyle2 = TextStyle(
      fontSize: 21, fontWeight: FontWeight.bold, color: AppStyles.textColor
  );
  static TextStyle headlineStyle3 = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w500
  );
  static TextStyle headlineStyle4 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey.shade700
  );
}