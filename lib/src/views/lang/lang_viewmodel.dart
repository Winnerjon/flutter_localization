import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/db_service.dart';

final langViewModel = ChangeNotifierProvider<LangViewModel>((ref) => LangViewModel());

class LangViewModel extends ChangeNotifier {
  String currentLang = "";
  late Locale _locale;
  ThemeMode _themeMode = ThemeMode.light;

  Locale get locale => _locale;

  ThemeMode get themeMode => _themeMode;

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
    currentLang = lang;
    await DBService.storeLang(lang);
    _locale = Locale(currentLang);
    notifyListeners();
  }

  void getTheme() {
    bool? isDark = DBService.loadTheme();
    if(isDark != null) {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void setTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    DBService.storeTheme(isDark);
    notifyListeners();
  }
}