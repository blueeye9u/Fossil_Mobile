import 'package:flutter/material.dart';

class NavigationUtil {
  static void navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void navigateToReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void navigateToNamedRoute(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void navigateToNamedReplacement(
      BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
