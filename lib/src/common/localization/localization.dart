import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalization {
  late final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  late Map<String, String> _localizedString;

  Future<void> load() async {
    String jsonString = await rootBundle.loadString("assets/lang/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedString = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String? translate(String key) {
    return _localizedString[key] ?? "";
  }

  static const supportedLocales = [
    Locale('uz', 'UZ'),
    Locale('en', 'US'),
    Locale('ru', 'RU'),
  ];

  static Locale? localeResolutionCallBack(Locale? locale, Iterable<Locale>? supportedLocales){
    if(supportedLocales != null && locale != null){
      return supportedLocales.firstWhere((element) =>
      element.languageCode == locale.languageCode,
          orElse: ()=> supportedLocales.first);
    }

    return null;
  }

  static const LocalizationsDelegate<AppLocalization> _delegate = AppLocalizationDelegate();

  static const localizationsDelegate = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    _delegate,
  ];
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["uz", "en", "ru"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}