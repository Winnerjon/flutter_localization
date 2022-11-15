import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/localization/text_keys.dart';
import 'lang_viewmodel.dart';

class LangScreen extends StatelessWidget {
  const LangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final read = ref.read(langViewModel);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff197d13),
          title: Text(TextKeys.selection.tr(context)),
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
                color: Colors.green,
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
                color: Colors.green,
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
                color: Colors.green,
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
