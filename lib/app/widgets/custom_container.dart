
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testapp/app/viewmodels/contact_controller.dart';
import 'package:get/get.dart';
import 'package:testapp/constant/app_color.dart';
import 'package:testapp/l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomContainer extends StatelessWidget {
  
  const CustomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.put(ContactController());
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
                  contactController.getLocalizedText(AppLocalizations.of(context)!.title, AppLocalizations.of(context)!.title_es),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                   contactController.getLocalizedText(AppLocalizations.of(context)!.subtitle, AppLocalizations.of(context)!.subtitle_es ),
                  style: TextStyle(
                    // fontSize: isSpanish ? 14.0 : 16.0,
                    fontSize: 16.0,
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