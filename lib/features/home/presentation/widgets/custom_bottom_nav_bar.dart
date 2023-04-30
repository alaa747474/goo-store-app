import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/features/home/business_logic/home_cubit/home_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r))),
          child: BottomNavigationBar(
              onTap: (currentIndex) {
                context.read<HomeCubit>().changeIndex(currentIndex);
              },
              backgroundColor: Theme.of(context).cardColor,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).hintColor,
              selectedIconTheme: IconThemeData(size: 30.r),
              unselectedIconTheme: IconThemeData(size: 30.r),
              elevation: 0,
              currentIndex: context.read<HomeCubit>().selectedIndex,
              items: const [
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.home),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.shopping_basket),
                    icon: Icon(Icons.shopping_basket_outlined),
                    label: 'Shop'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.shopping_cart),
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.favorite),
                    icon: Icon(Icons.favorite_outline),
                    label: 'Favorite'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.person_2),
                    icon: Icon(Icons.person_2_outlined),
                    label: 'Profile')
              ]),
        );
      },
    );
  }
}
