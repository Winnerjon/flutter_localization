import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/db_service.dart';

final langViewModel = ChangeNotifierProvider<LangViewModel>((ref) => LangViewModel());

class LangViewModel extends ChangeNotifier {
  String currentLang = "";
  late Locale _locale;

  Locale get locale => _locale;

  void getLang() {
    String? text = DBService.loadLang();
    switch(text) {
      case "uz":
        _locale = Locale(text!);
        break;
      case "ru":
        _locale = Locale(text!);
        break;
      default:
        _locale = const Locale("uz");
    }
  }

  void setLocal(String lang) async {
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

    await DBService.storeLang(lang);
    _locale = Locale(currentLang);
    notifyListeners();
  }
}