// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_declarations
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:testapp/app/widgets/contact_header_view.dart';
import 'package:testapp/app/widgets/contact_list_view.dart';
import 'package:testapp/app/widgets/search_contact_field.dart';

import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';

import 'package:testapp/app/models/contact_model.dart';

import 'package:testapp/app/widgets/contact_floating_button.dart';

class ContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              ContactHeaderView(),
              VerticalSpacing(),
              SearchContactField(),
              VerticalSpacing(),
              ContactListView(),
            ],
          ),
        ),
      ),
      floatingActionButton: ContactFloatingButton(),
    );
  }
}

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}