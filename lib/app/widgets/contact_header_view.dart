
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testapp/app/viewmodels/contact_controller.dart';

import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';


class ContactHeaderView extends StatelessWidget {
 
  const ContactHeaderView({Key? key}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.put(ContactController());
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        SizedBox(
          // width: isSpanish ? 60 : 80,
          width: 80,
        ),
        Text(
          contactController.getLocalizedText(AppLocalizations.of(context)!.contacttitle, AppLocalizations.of(context)!.contacttitle_es),
          style: AppStyle.headerStyle,
        ),
      ],
    );
  }
}