// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/models/contact_model.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:testapp/app/views/add_contact_page.dart';
import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';




class ContactListTile extends StatelessWidget {
  final ContactController contactController = Get.put(ContactController());
  final Contact contact;

  ContactListTile({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: contact.isSelected ? AppColor.highlight : Colors.transparent,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColor.primarySoft,
          child: Text(
            contact.name[0].toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          contact.name,
          style: AppStyle.titleStyle,
        ),
        subtitle: Text(
          contact.mobile,
          style: AppStyle.subtitleStyle,
        ),
        onTap: () => contactController.toggleSelection(contact as int),
      ),
    );
  }
}