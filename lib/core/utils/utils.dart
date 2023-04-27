import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Utils {
  Utils._();
  static final instanse = Utils._();
  Future<void> showCustomDialog(
      {required BuildContext context, required VoidCallback onPressed,required Widget child}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
          ),
          backgroundColor: Colors.white.withOpacity(0.2),
          content:const SingleChildScrollView(
            child: Text('data')
          ),
        );
      },
    );
  }
}
