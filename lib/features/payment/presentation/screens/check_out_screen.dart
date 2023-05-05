import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:goo_store_app/core/widgets/custom_button.dart';
import 'package:goo_store_app/features/payment/business_logic/payment_cubit/payment_cubit.dart';
import 'package:goo_store_app/features/payment/data/models/billing_data.dart';
import 'package:goo_store_app/features/payment/data/models/order_registration_details.dart';
import 'package:goo_store_app/features/payment/presentation/widgets/custom_text_field.dart';

import '../../data/models/order.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          text: 'Checkout',
          onPressed: () => Navigator.pop(context),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: 'First Name',
              controller: firstNameController,
            ),
            CustomTextField(
              hintText: 'Last Name',
              controller: lastNameController,
            ),
            CustomTextField(
              hintText: 'Email',
              controller: emailController,
            ),
            CustomTextField(
              hintText: 'Phone Number',
              controller: phoneController,
              keyboardType: TextInputType.phone,
            ),
            CustomTextField(
              hintText: 'Postal Code',
              controller: postalCodeController,
              keyboardType: TextInputType.phone,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Total amout :'), Text('150\$')],
            ),
            BlocConsumer<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if (state is PaymentAuthTokenLoaded) {
                  AppSecureStorage.instance.saveCurrentUserData(key: AppSecureStorage.authToken, data: state.paymentAuthToken.token);
                  Order order = Order(
                      authToken: state.paymentAuthToken.token,
                      amountCents: '500',
                      currency: 'EGP',
                      deliveryNeeded: 'false',
                      items: []);
                  context
                      .read<PaymentCubit>()
                      .paymentOrderRegistration(order: order);
                }
                if (state is PaymentOrderRegistrationDone) {
                  BillingData billingData = BillingData(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      phoneNumber: phoneController.text);
                  OrderRegistrationDetails orderRegistrationDetails =
                      OrderRegistrationDetails(
                          billingData: billingData,
                          orderId: state.id.toString(),
                          amountCents: '500',
                          authToken: context.read<PaymentCubit>().authToken);

                  context
                      .read<PaymentCubit>()
                      .getFinalPaymentToken(orderRegistrationDetails);
                }
              },
              builder: (context, state) {
                return CustomButton(onPressed: () {
                }, text: 'Submit Order');
              },
            )
          ],
        ));
  }
}
