import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/common/localization/localization.dart';
import 'src/common/routes/app_routes.dart';
import 'src/common/routes/routes.dart';
import 'src/views/lang/lang_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          final watch = ref.watch(langViewModel);
          return MaterialApp(
            initialRoute: AppRouteName.langScreen,
            onGenerateRoute: RouteGenerate.generateRout,

            locale: watch.currentLang != "" ? Locale(watch.currentLang) : const Locale("uz"),
            localeResolutionCallback: AppLocalization.localeResolutionCallBack,
            localizationsDelegates: AppLocalization.localizationsDelegate,
            supportedLocales: AppLocalization.supportedLocales,

            debugShowCheckedModeBanner: false,
          );
        }
      ),
    );
  }
}
