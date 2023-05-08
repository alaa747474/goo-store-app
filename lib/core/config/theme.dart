import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData? theme({required bool isDarkTheme}) {
    switch (isDarkTheme) {
      case true:
        return ThemeData(
           bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Color(0xff2A2C36),elevation: 1),
          hintColor: const Color.fromARGB(255, 169, 169, 169),
          primaryColor: const Color(0xffff7c2e),
          cardColor: const Color(0xff2A2C36),
          scaffoldBackgroundColor:const Color(0xff1E1F28),
          dividerColor: Colors.white,
          shadowColor: Colors.black,
          textTheme: textTheme(isDarkTheme: isDarkTheme),
        );
      case false:
        return ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white,elevation: 1),
          hintColor: const Color.fromARGB(255, 169, 169, 169),
          primaryColor: const Color(0xffff7c2e),
          cardColor: Colors.white,
          scaffoldBackgroundColor:  const Color(0xffE5E5E5),
          shadowColor: Colors.black,
          dividerColor: Colors.black,
          textTheme: textTheme(isDarkTheme: isDarkTheme),
        );
    }
    return null;
  }

  

  static TextTheme textTheme({required bool isDarkTheme}) {
    return TextTheme(
      labelLarge: TextStyle(
        color: !isDarkTheme? Colors.black:Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 35.sp,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.sp,
      ),
      titleLarge: TextStyle(
        color:  !isDarkTheme? Colors.black:Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      bodyMedium: TextStyle(
          color: !isDarkTheme? Colors.black:Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal
          ),

      bodyLarge: TextStyle(
          color: !isDarkTheme? Colors.black:Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold
          ),
      bodySmall: TextStyle(
          color: Colors.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal
          ),
    );
  }
}
