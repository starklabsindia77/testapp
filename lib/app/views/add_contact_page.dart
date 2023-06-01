// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
// ignore_for_file: prefer_const_constructors

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
  const AddContactPage({Key? key}) : super(key: key);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage>
    with SingleTickerProviderStateMixin {
  final ContactController _contactController = Get.put(ContactController());
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Stack(
          children: <Widget>[
            _buildListView(),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset('assets/svg/Parten.svg')),
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
                      if (_contactController.validateForm()) {
                        final newContact = _contactController.createContact();
                        // Call the addContact function to add the new contact
                        _contactController.addContact(newContact);
                        showSuccessPopup();
                      }
                    },
                    label: Text(_contactController.getLocalizedText(AppLocalizations.of(context)!.proceed, AppLocalizations.of(context)!.proceed_es),
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

  ListView _buildListView() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            children: <Widget>[
              _buildAppBarWidget(),
              const SizedBox(height: 10),
              const CustomContainer(),
              const SizedBox(height: 25),
              _buildContactForm(),
            ],
          ),
        ),
      ],
    );
  }

  AppBarWidget _buildAppBarWidget() {
  return AppBarWidget(
    title: _contactController.getLocalizedText(
        AppLocalizations.of(context)!.create,
        AppLocalizations.of(context)!.create_es) ,
  );
}

  ContactForm _buildContactForm() {
    return ContactForm(
      contactController: _contactController,
      nameLabel: _contactController.getLocalizedText(
          AppLocalizations.of(context)!.name,
          AppLocalizations.of(context)!.name_es),
      nameError: _contactController.getLocalizedText(
          AppLocalizations.of(context)!.nametext,
          AppLocalizations.of(context)!.nametext_es),
      emailLabel: _contactController.getLocalizedText(
          AppLocalizations.of(context)!.email,
          AppLocalizations.of(context)!.email_es),
      emailError: _contactController.getLocalizedText(
          AppLocalizations.of(context)!.emailtext,
          AppLocalizations.of(context)!.emailtext_es),
      phoneLabel: _contactController.getLocalizedText(
          AppLocalizations.of(context)!.phone,
          AppLocalizations.of(context)!.phone_es),
      phoneError: _contactController.getLocalizedText(
          AppLocalizations.of(context)!.phonetext,
          AppLocalizations.of(context)!.phonetext_es),
    );
  }

  

  void showSuccessPopup() {
    Get.dialog(_buildSuccessPopup());

    _animationController.reset();

    _animationController.forward().then((_) {
      _contactController.clearForm();
      Get.back();
    });
  }

  Widget _buildSuccessPopup() {
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
          children: <Widget>[
            _buildAnimatedBuilder(),
            const SizedBox(height: 16.0),
            Text(
              'Contact Added',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColor.primarySoft,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedBuilder _buildAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: const Icon(
              Icons.check_circle,
              color: AppColor.primary,
              size: 80.0,
            ),
          ),
        );
      },
    );
  }
}
