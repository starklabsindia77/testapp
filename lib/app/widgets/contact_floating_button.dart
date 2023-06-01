// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:testapp/app/views/add_contact_page.dart';
import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';




class ContactFloatingButton extends StatelessWidget {
  

  const ContactFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.put(ContactController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: SizedBox(
        width: 180,
        child: FloatingActionButton.extended(
          backgroundColor: AppColor.secondary,
          onPressed: () {
            // Navigate to the AddContactPage
            Get.to(() => AddContactPage());
          },
          label: Text(
            contactController.getLocalizedText(AppLocalizations.of(context)!.add, AppLocalizations.of(context)!.add_es),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
