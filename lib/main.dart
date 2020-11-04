import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:weather_conditions/utils/app_pages.dart';
import 'package:weather_conditions/utils/app_translations.dart';

import 'bindings/initial_bindings.dart';

void main() {
  runApp(DevicePreview(enabled: false, builder:(_) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      //locale: DevicePreview.of(context).locale,
      //builder: DevicePreview.appBuilder,
      fallbackLocale: Locale('en', 'US'),
      translations: AppTranslations(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      getPages: AppPages.pages,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}