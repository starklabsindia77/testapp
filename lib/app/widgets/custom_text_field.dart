// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testapp/constant/app_color.dart';



class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String errorMessage;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.errorMessage,
  }) : super(key: key);

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