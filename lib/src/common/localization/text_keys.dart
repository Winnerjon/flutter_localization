import 'localization.dart';

enum TextKeys {
  selection,
  info,
} extension TextKeysExtension on TextKeys {
  String get text => toString().split(".")[1];

  String tr(context) {
    return AppLocalization.of(context)!.translate(text) ?? "";
  }
}