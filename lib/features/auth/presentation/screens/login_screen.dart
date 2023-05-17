import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/core/widgets/custom_button.dart';
import 'package:goo_store_app/core/widgets/erorr_text.dart';
import 'package:goo_store_app/core/widgets/loading_indicator.dart';
import 'package:goo_store_app/features/auth/business_logic/auth_cubit/auth_cubit.dart';
import 'package:goo_store_app/features/auth/presentation/widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
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
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Login',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                height: 10.h,
              ),
              AuthTextField(
                labelText: 'E-mail',
                controller: emailController,
              ),
              AuthTextField(
                labelText: 'Password',
                controller: passwordController,
              ),
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is UserLoggedInSuccessfully) {
                    AppSecureStorage.instance.saveCurrentUserData(
                        key: 'TOKEN', data: state.loginModel.userData!.token!);
                        Navigator.pushNamed(context, AppRoutes.homeScreen);
                  }
                },
                builder: (context, state) {
                  if (state is AuthFailed) {
                    return ErrorText(text: state.error,);
                  }
                  if (state is AuthLoading) {
                    return const LoadingIndicator();
                  }
                  return CustomButton(
                      onPressed: () {
                        context.read<AuthCubit>().loginAndGetUserData(
                            email: emailController.text,
                            password: passwordController.text);
                      },
                      text: 'Login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
