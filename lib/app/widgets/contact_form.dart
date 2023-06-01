// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:testapp/app/widgets/custom_text_field.dart';


class ContactForm extends StatelessWidget {
  final ContactController contactController;
  final String nameLabel;
  final String nameError;
  final String emailLabel;
  final String emailError;
  final String phoneLabel;
  final String phoneError;

  const ContactForm({
    Key? key,
    required this.contactController,
    required this.nameLabel,
    required this.nameError,
    required this.emailLabel,
    required this.emailError,
    required this.phoneLabel,
    required this.phoneError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: contactController.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: contactController.nameController,
            label: nameLabel,
            errorMessage: nameError,
          ),
          SizedBox(height: 15.0),
          CustomTextField(
            controller: contactController.emailController,
            label: emailLabel,
            errorMessage: emailError,
          ),
          SizedBox(height: 15.0),
          CustomTextField(
            controller: contactController.mobileController,
            label: phoneLabel,
            errorMessage: phoneError,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}