import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.onPressed, required this.text,this.icon});
 final IconData? icon;
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Text(text,style: Theme.of(context).textTheme.bodyLarge,),
            Icon(icon??Icons.arrow_forward_ios,color: Theme.of(context).dividerColor,)
          ],
        ),
      ),
    );
  }
}