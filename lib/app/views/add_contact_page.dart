// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> with SingleTickerProviderStateMixin {
  final KeyboardVisibilityController _keyboardVisibilityController = KeyboardVisibilityController();
  final ContactController contactController = Get.put(ContactController());

  // Animation properties
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation
    _initAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isSpanish = Localizations.localeOf(context).languageCode == 'es';
    return KeyboardVisibilityProvider(
      controller: _keyboardVisibilityController,
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 16.0, right: 16.0),
                        child: AppBarWidget(
                          title: isSpanish ? loc.create_es : loc.create,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomContainer(isSpanish: isSpanish, loc: loc),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ContactForm(
                          contactController: contactController,
                          nameLabel: isSpanish ? loc.name_es : loc.name,
                          nameError: isSpanish ? loc.nametext_es : loc.nametext,
                          emailLabel: isSpanish ? loc.email_es : loc.email,
                          emailError:
                              isSpanish ? loc.emailtext_es : loc.emailtext,
                          phoneLabel: isSpanish ? loc.phone_es : loc.phone,
                          phoneError:
                              isSpanish ? loc.phonetext_es : loc.phonetext,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/svg/Parten.svg',
              ),
            ),
          ],
        ),
        floatingActionButton: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            if (isKeyboardVisible) {
              return Container();
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: SizedBox(
                  width: 324,
                  child: FloatingActionButton.extended(
                    backgroundColor: AppColor.secondary,
                    onPressed: () {
                      if (contactController.validateForm()) {
                        final newContact = contactController.createContact();
                        // Call the addContact function to add the new contact
                        contactController.addContact(newContact);
                        showSuccessPopup();
                      }
                    },
                    label: Text(isSpanish ? loc.proceed_es : loc.proceed,
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              );
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void showSuccessPopup() {
    // Reset the animation
    Get.dialog(buildSuccessPopup(context));

    _animationController.reset();

    // Start the animation
    _animationController.forward().then((_) {
      // Animation completed, reset form and navigate back
      contactController.clearForm();
      Get.back();
    });
  }

  Widget buildSuccessPopup(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _animation,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Icon(
                      Icons.check_circle,
                      color: AppColor.primary,
                      size: 80.0,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Added',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primarySoft),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        SizedBox(width: 80),
        Text(
          title,
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

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String errorMessage;

  const CustomTextField({
    required this.controller,
    required this.label,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: AppColor.textfield,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: AppColor.border),
        ),
      ),
      style: TextStyle(color: Colors.white),
      validator: (value) {
        if (value!.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}

class ContactForm extends StatelessWidget {
  final ContactController contactController;
  final String nameLabel;
  final String nameError;
  final String emailLabel;
  final String emailError;
  final String phoneLabel;
  final String phoneError;

  const ContactForm({
    required this.contactController,
    required this.nameLabel,
    required this.nameError,
    required this.emailLabel,
    required this.emailError,
    required this.phoneLabel,
    required this.phoneError,
  });

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

class CustomContainer extends StatelessWidget {
  final bool isSpanish;
  final AppLocalizations loc;

  const CustomContainer({
    required this.isSpanish,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(100.0),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/svg/Vector.svg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 20.0,
            left: 20.0,
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: CircularProgressIndicator(
                value: 0.25,
                strokeWidth: 12.0,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
          ),
          Positioned(
            top: 37.0,
            left: 35.0,
            child: Text(
              '1/4',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isSpanish ? loc.title_es : loc.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  isSpanish ? loc.subtitle_es : loc.subtitle,
                  style: TextStyle(
                    fontSize: isSpanish ? 14.0 : 16.0,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
