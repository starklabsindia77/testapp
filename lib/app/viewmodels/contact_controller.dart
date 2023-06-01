import 'package:get/get.dart';
import 'package:testapp/app/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactController extends GetxController {
  // Mock list of contacts.
  var contactList = List<Contact>.empty(growable: true).obs;
  var allContactList = List<Contact>.empty(growable: true).obs; // List to hold all contacts
  RxInt selectedContactIndex = (-1).obs;  // Init with -1 to indicate no contact is selected

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  void fetchContacts() {
    var mockContacts = [
      Contact(name: "John", mobile: "+1 839 9399 0303", email: "John@example.com"),
      Contact(name: "Anil Ji", mobile: "+1 839 9399 0403", email: "John@example.com" ),
      Contact(name: "Amit Ji", mobile: "+1 839 9355 0303", email: "John@example.com" ),
      Contact(name: "Smith", mobile: "+1 839 1299 0303", email: "John@example.com"),
      Contact(name: "Bob", mobile: "+1 839 1399 1103", email: "John@example.com" ),
      Contact(name: "John", mobile: "+1 839 9399 0303", email: "John@example.com"),
      Contact(name: "Anil Ji", mobile: "+1 839 9399 0403", email: "John@example.com" ),
      Contact(name: "Amit Ji", mobile: "+1 839 9355 0303", email: "John@example.com" ),
      Contact(name: "Smith", mobile: "+1 839 1299 0303", email: "John@example.com"),
      Contact(name: "Bob", mobile: "+1 839 1399 1103", email: "John@example.com" ),
      Contact(name: "John", mobile: "+1 839 9399 0303", email: "John@example.com"),
      Contact(name: "Anil Ji", mobile: "+1 839 9399 0403", email: "John@example.com" ),
      Contact(name: "Amit Ji", mobile: "+1 839 9355 0303", email: "John@example.com" ),
      Contact(name: "Smith", mobile: "+1 839 1299 0303", email: "John@example.com"),
      Contact(name: "Bob", mobile: "+1 839 1399 1103", email: "John@example.com" ),
    ];

    contactList.assignAll(mockContacts);
    allContactList.assignAll(mockContacts); // Store all contacts in allContactList
  }

  void searchContact(String query) {
    if (query.isEmpty) {
      // if the search query is empty, display all contacts
      contactList.assignAll(allContactList);
    } else {
      // if the search query is not empty, display only the contacts that match the query
      var newList = allContactList.where((contact) => contact.name.toLowerCase().contains(query.toLowerCase())).toList();
      contactList.assignAll(newList);
    }
  }

  void toggleSelection(int index) {
    if (selectedContactIndex.value != -1) {
      // Reset the previously selected contact
      contactList[selectedContactIndex.value].isSelected = false;
    }

    // Set the new contact as selected
    contactList[index].isSelected = true;
    selectedContactIndex.value = index;

    contactList.refresh();
  }

  void addContact(Contact newContact) {
    contactList.add(newContact);
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }

  Contact createContact() {
    return Contact(
      name: nameController.text,
      email: emailController.text,
      mobile: mobileController.text,
    );
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    mobileController.clear();
  }



}
