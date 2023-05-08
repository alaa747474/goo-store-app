import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:goo_store_app/features/profile/business_logic/settings_cubit/setting_cubit.dart';
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
           BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                return UserInformationCard(profile: state.profile,);
              }
              return const LoadingIndicator();
            },
          ),
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
          SettingItem(onPressed: () {}, text: 'Orders'),
          SettingItem(onPressed: () {}, text: 'Log out')
        ],
      ),
    );
  }
}
