import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/common/localization/localization.dart';
import 'src/common/routes/app_routes.dart';
import 'src/common/routes/routes.dart';
import 'src/common/theme/theme_constants.dart';
import 'src/services/db_service.dart';
import 'src/views/lang/lang_viewmodel.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox(DBService.DB_NAME);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  void initState() {
    ref.read(langViewModel).getLang();
    ref.read(langViewModel).getTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(langViewModel).themeMode,
      initialRoute: AppRouteName.langScreen,
      onGenerateRoute: RouteGenerate.generateRout,

      locale: ref.watch(langViewModel).locale,
      localeResolutionCallback: AppLocalization.localeResolutionCallBack,
      localizationsDelegates: AppLocalization.localizationsDelegate,
      supportedLocales: AppLocalization.supportedLocales,

      debugShowCheckedModeBanner: false,
    );
  }
}
