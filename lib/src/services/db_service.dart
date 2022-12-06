import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class DBService {
  static String DB_NAME = 'supervayzer';
  static Box box = Hive.box(DB_NAME);

  static Future<void> storeLang(String lang) async {
    await box.put("lang", lang);
  }

  static String? loadLang() {
    String? lang = box.get("lang");
    return lang;
  }

  static Future<void> storeTheme(bool theme) async {
    await box.put("theme", theme);
  }

  static bool? loadTheme() {
    bool? theme = box.get("theme");
    return theme;
  }
}