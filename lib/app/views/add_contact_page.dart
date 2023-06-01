// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';

import 'package:testapp/app/widgets/contact_form.dart';
import 'package:testapp/app/widgets/custom_container.dart';

import 'package:testapp/app/widgets/app_bar.dart';



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
                          title: contactController.getLocalizedText(AppLocalizations.of(context)!.create, AppLocalizations.of(context)!.create_es ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomContainer(),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ContactForm(
                          contactController: contactController,
                          nameLabel: contactController.getLocalizedText( AppLocalizations.of(context)!.name, AppLocalizations.of(context)!.name_es ),
                          nameError: contactController.getLocalizedText( AppLocalizations.of(context)!.nametext, AppLocalizations.of(context)!.nametext_es),
                          emailLabel: contactController.getLocalizedText( AppLocalizations.of(context)!.email, AppLocalizations.of(context)!.email_es ),
                          emailError:
                              contactController.getLocalizedText( AppLocalizations.of(context)!.emailtext, AppLocalizations.of(context)!.emailtext_es  ),
                          phoneLabel: contactController.getLocalizedText( AppLocalizations.of(context)!.phone, AppLocalizations.of(context)!.phone_es ),
                          phoneError:
                              contactController.getLocalizedText( AppLocalizations.of(context)!.phonetext, AppLocalizations.of(context)!.phonetext_es),
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
                    label: Text(contactController.getLocalizedText(AppLocalizations.of(context)!.proceed, AppLocalizations.of(context)!.proceed_es),
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