import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/localization/text_keys.dart';
import 'lang_viewmodel.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({Key? key}) : super(key: key);

  @override
  State<LangScreen> createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final read = ref.read(langViewModel);
      final watch = ref.watch(langViewModel);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          title: Text(TextKeys.selection.tr(context)),
          actions: [
            Switch(
              value: watch.themeMode == ThemeMode.dark,
              onChanged: (value) {
                read.setTheme(value);
              },
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            TextKeys.info.tr(context),
            textAlign: TextAlign.center,
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                height: 45,
                color: Theme.of(context).buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  read.setLocal("uz");
                },
                child: const Text("Uzbek"),
              ),
              MaterialButton(
                height: 45,
                color: Theme.of(context).buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  read.setLocal("en");
                },
                child: const Text("England"),
              ),
              MaterialButton(
                height: 45,
                color: Theme.of(context).buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  read.setLocal("ru");
                },
                child: const Text("Россия"),
              ),
            ],
          ),
        ),
      );
    });
  }
}
