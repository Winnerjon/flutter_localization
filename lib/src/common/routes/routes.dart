import 'package:flutter/material.dart';

import '../../views/lang/lang_screen.dart';
import 'app_routes.dart';

class RouteGenerate {
  const RouteGenerate._();

  static Route<dynamic> generateRout(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.langScreen:
        return MaterialPageRoute<LangScreen>(
            builder: (_) => const LangScreen(),settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(),settings: settings);
    }
  }
}

class RoutException implements Exception {
  final String message;
  const RoutException(this.message);
}
