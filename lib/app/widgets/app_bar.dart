
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/constant/app_color.dart';



class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

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
          style: AppStyle.headerStyle,
        ),
      ],
    );
  }
}