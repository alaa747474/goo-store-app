import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/features/profile/business_logic/cubit/setting_cubit.dart';
import 'package:goo_store_app/features/profile/presentation/widgets/setting_item.dart';
import 'package:goo_store_app/features/profile/presentation/widgets/user_information_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
        children: [
          Text(
            'My Profile',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const UserInformationCard(),
          BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              bool isDark = context.read<SettingCubit>().isDark;
              return SettingItem(
                onPressed: () {
                  context.read<SettingCubit>().changeAppTheme();
                },
                text: 'Change theme',
                icon: isDark ? Icons.light_mode : Icons.dark_mode,
              );
            },
          ),
          SettingItem(onPressed: () {}, text: 'My oreders'),
          SettingItem(onPressed: () {}, text: 'Log out')
        ],
      ),
    );
  }
}
