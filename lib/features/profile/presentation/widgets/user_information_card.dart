import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInformationCard extends StatelessWidget {
  const UserInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:10.h,bottom: 20.h),
      child: Row(
        children: [
          CircleAvatar(radius: 35.r,),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text('Useremail@example.com'),
              Text('User name',style: TextStyle(color: Theme.of(context).hintColor),)
            ],
          )
        ],
      ),
    );
  }
}