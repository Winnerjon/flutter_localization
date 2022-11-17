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
}