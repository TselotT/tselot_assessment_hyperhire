import 'package:assessment/ui/landing_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? Function(RouteSettings settings) onGenerateRoute = (settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(
        builder: (context) => const LandingPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const LandingPage(),
      );
  }
};
