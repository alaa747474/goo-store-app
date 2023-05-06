import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/core/widgets/erorr_text.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';

import '../../business_logic/home_cubit/home_cubit.dart';

class HomeDataScreen extends StatelessWidget {
  const HomeDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeDataLoaded) {
            return Image.network(state.homeData.data!.ad!);
          }
          if (state is HomeFailur) {
            return Text(
              state.error,
              style: TextStyle(fontSize: 100),
            );
          }
          return LoadingIndicator();
        },
      ),
    );
  }
}
