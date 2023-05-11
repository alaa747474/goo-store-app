import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:goo_store_app/core/widgets/erorr_text.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/home/presentation/widgets/banners_carousel_slider.dart';
import 'package:goo_store_app/features/products/presentation/widgets/products_grid_view.dart';

import '../../business_logic/home_cubit/home_cubit.dart';

class HomeDataScreen extends StatefulWidget {
  const HomeDataScreen({super.key});

  @override
  State<HomeDataScreen> createState() => _HomeDataScreenState();
}

class _HomeDataScreenState extends State<HomeDataScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Home'),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeDataLoaded) {
            return ListView(
              padding: EdgeInsets.only(bottom: 20.h, top: 10.h),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                BannersCarouselSlider(banners: state.homeData.data!.banners!),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sale',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            'Supper summer sale',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.productScreen);
                          },
                          child: Text(
                            'view more',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ProductsGridView(
                      length: 4,
                      products: state.homeData.data!.products!
                          .where((element) => element.discount != 0)
                          .toList()),
                )
              ],
            );
          }
          if (state is HomeFailur) {
            return ErrorText(
              text: state.error,
            );
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
