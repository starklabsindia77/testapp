// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Import the localization files
import 'package:testapp/l10n/app_localizations_es.dart';
import 'package:testapp/l10n/app_localizations_en.dart';

abstract class AppLocalizations {
  // Define your common translations here
  String get selectContact;

  // Factory method to create an instance of the appropriate localization class based on the locale
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Define the supported locales
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];

  // Factory method to create the appropriate localization class based on the locale
  static Future<AppLocalizations> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return AppLocalizationsEn();
      case 'es':
        return AppLocalizationsEs();
      default:
        return AppLocalizationsEn();
    }
  }
}
