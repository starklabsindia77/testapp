// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:testapp/app/views/contact_view.dart';
import 'package:testapp/app/views/add_contact_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:testapp/l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultLocale = WidgetsBinding.instance.window.locale;
    // final locale = Locale(defaultLocale.languageCode.isEmpty ? 'es' : defaultLocale.languageCode);
    final Locale locale = Locale('en');

    return GetMaterialApp(
      title: 'Contact App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
      ],
      locale: locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => ContactView()),
        GetPage(name: '/addContact', page: () => AddContactPage()),
      ],
    );
  }
}
