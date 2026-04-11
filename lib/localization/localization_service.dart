import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalizationService {
  // static const enLocale = Locale('en');
  static const arLocale = Locale('ar');


  static List<Locale> get supportedLocales => [arLocale];

  static Future<void> initLocalization() async {
    await EasyLocalization.ensureInitialized();
  }
}

// flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart