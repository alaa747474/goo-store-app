import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      this.keyboardType,
      required this.labelText,
      required this.controller,
      this.validator,
      this.obscure = false});
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  final bool obscure;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.r),
            filled: true,
            alignLabelWithHint: false,
            fillColor: Theme.of(context).cardColor,
            labelText: labelText,
            floatingLabelStyle:
                TextStyle(color: Theme.of(context).primaryColor),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
