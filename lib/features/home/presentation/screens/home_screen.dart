import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/core/service/service_locator.dart';

import 'package:goo_store_app/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:goo_store_app/features/home/data/repositories/home_repository.dart';
import 'package:goo_store_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepository>())..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: const CustomBottomNavBar(),
            body: context
                .read<HomeCubit>()
                .screens[context.read<HomeCubit>().selectedIndex],
          );
        },
      ),
    );
  }
}
