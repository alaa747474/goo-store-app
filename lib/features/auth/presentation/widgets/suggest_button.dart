import 'package:flutter/material.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';

class SuggestButton extends StatelessWidget {
  const SuggestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, AppRoutes.logInScreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Already have an account?',style: Theme.of(context).textTheme.bodyMedium,),
          Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }
}