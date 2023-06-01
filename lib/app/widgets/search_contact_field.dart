// ignore_for_file: prefer_const_declarations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testapp/app/viewmodels/contact_controller.dart';

import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';


class SearchContactField extends StatelessWidget {
  const SearchContactField({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.put(ContactController());
    final labelStyle = const TextStyle(color: Colors.grey);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    );
    
    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.white, width: 2.0),
    );
    
    return Container(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: contactController.getLocalizedText(AppLocalizations.of(context)!.search, AppLocalizations.of(context)!.search_es),
          labelStyle: labelStyle,
          filled: true,
          fillColor: AppColor.textfield,
          border: border,
          focusedBorder: focusedBorder,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              contactController.clearSearch();
            },
          ),
        ),
        style: const TextStyle(color: Colors.white),
        onChanged: (value) {
          contactController.searchContact(value);
        },
      ),
    );
  }
}
