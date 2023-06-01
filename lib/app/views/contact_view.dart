// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:testapp/app/views/add_contact_page.dart';
import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';



class ContactView extends StatelessWidget {
  final ContactController contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {  
    final loc = AppLocalizations.of(context)!;
    final isSpanish = Localizations.localeOf(context).languageCode == 'es';
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ContactHeaderView(isSpanish: isSpanish, loc: loc),
              SizedBox(
                height: 15,
              ),
              SearchContactField(contactController: contactController, isSpanish: isSpanish, loc: loc),
              SizedBox(height: 10.0),
              ContactListView(contactController: contactController),
            ],
          ),
        ),
      ),
      floatingActionButton: ContactFloatingButton(isSpanish: isSpanish, loc: loc),
    );
  }
}

class ContactHeaderView extends StatelessWidget {
  const ContactHeaderView({required this.isSpanish, required this.loc});

  final bool isSpanish;
  final AppLocalizations loc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        SizedBox(
          width: isSpanish ? 60 : 80,
        ),
        Text(
          isSpanish ? loc.contacttitle_es : loc.contacttitle,
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class SearchContactField extends StatelessWidget {
  const SearchContactField({required this.contactController, required this.isSpanish, required this.loc});

  final ContactController contactController;
  final bool isSpanish;
  final AppLocalizations loc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: isSpanish ? loc.search_es : loc.search,
          labelStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: AppColor.textfield,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.white, width: 2.0),
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(Icons.close, color: Colors.grey),
            onPressed: () {},
          ),
        ),
        style: TextStyle(color: Colors.white),
        onChanged: (value) {
          contactController.searchContact(value);
        },
      ),
    );
  }
}

class ContactListView extends StatelessWidget {
  const ContactListView({required this.contactController});

  final ContactController contactController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: contactController.contactList.length,
          itemBuilder: (_, index) {
            return ContactListTile(contactController: contactController, index: index);
          },
        ),
      ),
    );
  }
}

class ContactListTile extends StatelessWidget {
  const ContactListTile({required this.contactController, required this.index});

  final ContactController contactController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: contactController.contactList[index].isSelected
          ? AppColor.highlight
          : Colors.transparent,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColor.primarySoft,
          child: Text(
            contactController.contactList[index].name[0].toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          contactController.contactList[index].name,
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          contactController.contactList[index].mobile,
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 13.0,
            color: Colors.grey,
          ),
        ),
        onTap: () => contactController.toggleSelection(index),
      ),
    );
  }
}

class ContactFloatingButton extends StatelessWidget {
  const ContactFloatingButton({required this.isSpanish, required this.loc});

  final bool isSpanish;
  final AppLocalizations loc;

  @override
  Widget build(BuildContext context) {
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
          label: Text(isSpanish ? loc.add_es : loc.add, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

