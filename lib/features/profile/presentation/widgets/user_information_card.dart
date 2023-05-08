import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:goo_store_app/features/profile/data/models/profile.dart';

class UserInformationCard extends StatelessWidget {
  const UserInformationCard({
    Key? key,
    required this.profile,
  }) : super(key: key);
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:10.h,bottom: 20.h),
      child: Row(
        children: [
          CircleAvatar(radius: 35.r,backgroundImage: NetworkImage(profile.image!),),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profile.email!),
              Text(profile.name!,style: TextStyle(color: Theme.of(context).hintColor),)
            ],
          )
        ],
      ),
    );
  }
}
