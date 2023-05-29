// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:testapp/app/models/contact_model.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final KeyboardVisibilityController _keyboardVisibilityController =
      KeyboardVisibilityController();
  final ContactController contactController = Get.put(ContactController());


   // Animation properties
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
                        padding: const EdgeInsets.only(top:16.0, left:16.0, right:16.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Get.back(),
                            ),
                            SizedBox(width:80),
                            Text(
                              isSpanish ? loc.create_es : loc.create,
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black),
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
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: isSpanish ? loc.name_es : loc.name,
                                  labelStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: AppColor.textfield,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        BorderSide(color: AppColor.border),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return isSpanish ? loc.nametext_es : loc.nametext;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.0),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: isSpanish ? loc.email_es : loc.email,
                                  labelStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: AppColor.textfield,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        BorderSide(color: AppColor.border),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return isSpanish ? loc.emailtext_es : loc.emailtext;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15.0),
                              TextFormField(
                                controller: mobileController,
                                decoration: InputDecoration(
                                  labelText: isSpanish ? loc.phone_es : loc.phone,
                                  labelStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: AppColor.textfield,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide:
                                        BorderSide(color: AppColor.border),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return isSpanish ? loc.phonetext_es : loc.phonetext;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
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
                fit: BoxFit.fill,
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
                      if (_formKey.currentState!.validate()) {
                        final newContact = Contact(
                          name: nameController.text,
                          email: emailController.text,
                          mobile: mobileController.text,
                        );
                        // Call the addContact function to add the new contact
                        contactController.addContact(newContact);
                        // Get.back();
                        showSuccessPopup();
                      }
                    },
                    label:
                        Text(isSpanish ? loc.proceed_es : loc.proceed, style: TextStyle(color: Colors.white)),
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
      nameController.clear();
      emailController.clear();
      mobileController.clear();
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
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColor.primarySoft), 
            ),
          ],
        ),
      ),
    );
  }
}
