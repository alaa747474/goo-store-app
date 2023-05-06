import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      required this.controller,
      this.validator,
      this.obscure = false});
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
    style: TextStyle(color: Theme.of(context).dividerColor),
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.r),
          filled: true,
          fillColor: Theme.of(context).cardColor,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none)),
    );
  }
}