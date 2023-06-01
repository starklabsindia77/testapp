import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:testapp/app/widgets/contact_list_title.dart';



class ContactListView extends StatelessWidget {
  const ContactListView({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.put(ContactController());
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: contactController.contactList.length,
          itemBuilder: (_, index) {
            final contact = contactController.contactList[index];
            return ContactListTile(contact: contact);
          },
        ),
      ),
    );
  }
}