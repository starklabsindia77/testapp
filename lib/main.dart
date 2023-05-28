// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:testapp/app/views/contact_view.dart';
import 'package:testapp/app/views/add_contact_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Contact App',
      debugShowCheckedModeBanner: false,
      
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
