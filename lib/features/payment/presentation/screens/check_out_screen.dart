import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo_store_app/core/constants/app_routes.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/service_locator.dart';
import 'package:goo_store_app/core/widgets/custom_app_bar.dart';
import 'package:goo_store_app/core/widgets/custom_button.dart';
import 'package:goo_store_app/features/cart/presentation/widgets/price_row.dart';
import 'package:goo_store_app/features/payment/business_logic/payment_cubit/payment_cubit.dart';
import 'package:goo_store_app/features/payment/data/models/billing_data.dart';
import 'package:goo_store_app/features/payment/data/models/order_registration_details.dart';
import 'package:goo_store_app/features/payment/data/repositories/payment_repository.dart';
import 'package:goo_store_app/features/payment/presentation/widgets/custom_text_field.dart';

import '../../data/models/order.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);
  final num totalAmount;
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
    return BlocProvider.value(
      value: PaymentCubit(getIt.get<PaymentRepository>())
        ..getPaymentAuthToken(),
      child: Scaffold(
          appBar: CustomAppBar(
            text: 'Checkout',
            onPressed: () => Navigator.pop(context),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
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
                PriceRow(text: 'Total', price: widget.totalAmount),
                SizedBox(height: 10.h,),
                BlocConsumer<PaymentCubit, PaymentState>(
                  listener: (context, state) {
                    if (state is PaymentAuthTokenLoaded) {
                      context.read<PaymentCubit>().authToken =
                          state.paymentAuthToken.token;
                      Order order = Order(
                          authToken: state.paymentAuthToken.token,
                          amountCents: widget.totalAmount.toString(),
                          currency: 'EGP',
                          deliveryNeeded: 'false',
                          items: []);
                      context
                          .read<PaymentCubit>()
                          .paymentOrderRegistration(order: order);
                    }
                    if (state is PaymentFinalTokenLoaded) {
                      Navigator.pushNamed(context, AppRoutes.cardScreen,
                          arguments: state.paymentFinalTokenLoaded);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                        onPressed: () {
                          if (state is PaymentOrderRegistrationDone) {
                            BillingData billingData = BillingData(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                postalCode: postalCodeController.text,
                                phoneNumber: phoneController.text);
                            OrderRegistrationDetails orderRegistrationDetails =
                                OrderRegistrationDetails(
                                    integrationId:
                                        AppEndPoints.paymentIntegrationId,
                                    currency: 'EGP',
                                    billingData: billingData,
                                    orderId: '${state.id}',
                                    amountCents: widget.totalAmount.toString(),
                                    authToken:
                                        context.read<PaymentCubit>().authToken);

                            context
                                .read<PaymentCubit>()
                                .getFinalPaymentToken(orderRegistrationDetails);
                          }
                        },
                        text: 'Submit Order');
                  },
                )
              ],
            ),
          )),
    );
  }
}
