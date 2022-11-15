import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final langViewModel = ChangeNotifierProvider<LangViewModel>((ref) => LangViewModel());

class LangViewModel extends ChangeNotifier {
  String currentLang = "";

  void setLocal(String lang) {
    switch(lang) {
      case "uz":
        currentLang = "uz";
        break;
      case "en":
        currentLang = "en";
        break;
      case "ru":
        currentLang = "ru";
        break;
      default:
        currentLang = "uz";
    }
    notifyListeners();
  }
}