// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:testapp/app/views/add_contact_page.dart';
import 'package:testapp/constant/app_color.dart';

class ContactView extends StatelessWidget {
  final ContactController contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'Select Contact',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Search',
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
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: contactController.contactList.length,
                    itemBuilder: (_, index) {
                      return Container(
                        color: contactController.contactList[index].isSelected
                            ? AppColor.highlight
                            : Colors.transparent,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColor.primarySoft,
                            child: Text(
                              contactController.contactList[index].name[0]
                                  .toUpperCase(),
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
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: SizedBox(
          width: 140,
          child: FloatingActionButton.extended(
            backgroundColor: AppColor.secondary,
            onPressed: () {
              // Navigate to the AddContactPage
              Get.to(() => AddContactPage());
            },
            label: Text('Add Contact', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
