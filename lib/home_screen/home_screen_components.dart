import 'package:flutter/cupertino.dart';

BottomNavigationBarItem bottomNavigationBarItem(
    String label, String icon, Color backgroundColor) {
  return BottomNavigationBarItem(
    // backgroundColor: backgroundColor,
    label: label,
    icon: Image.asset(icon),
  );
}
