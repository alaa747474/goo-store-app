import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/core/widgets/custom_button.dart';
import 'package:goo_store_app/features/auth/business_logic/auth_cubit/auth_cubit.dart';
import 'package:goo_store_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:goo_store_app/features/auth/presentation/widgets/suggest_button.dart';

import '../../../../core/widgets/loading_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/lock.png'),
              SizedBox(height: 20.h,),
              Text(
                'Sign up',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 10.h,),
              AuthTextField(
                labelText: 'Name',
                controller: nameController,
              ),
              AuthTextField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'E-mail',
                controller: emailController,
              ),
              AuthTextField(
                labelText: 'Password',
                controller: passwordController,
              ),
              AuthTextField(
                keyboardType: TextInputType.phone,
                labelText: 'phone',
                controller: phoneController,
              ),
              SizedBox(height: 5.h,),
              const SuggestButton(),
              const SizedBox(height: 50,),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is UserLoggedInSuccessfully) {
                    AppSecureStorage.instance.saveCurrentUserData(
                        key: 'TOKEN', data: state.loginModel.userData!.token!);
                        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeScreen, (route) => false);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const LoadingIndicator();
                  }
                  return CustomButton(
                      onPressed: () {
                        context.read<AuthCubit>().createAccount(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            name: nameController.text.trim(),
                            phone: phoneController.text.trim());
                      },
                      text: 'Sign up');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
