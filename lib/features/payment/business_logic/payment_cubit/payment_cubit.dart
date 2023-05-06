import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:goo_store_app/features/payment/data/models/order.dart';
import 'package:goo_store_app/features/payment/data/models/order_registration_details.dart';
import 'package:goo_store_app/features/payment/data/models/payment_auth.dart';
import 'package:goo_store_app/features/payment/data/repositories/payment_repository.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._paymentRepository) : super(PaymentInitial());
  final PaymentRepository _paymentRepository;
   late String authToken;
  void getPaymentAuthToken() {
    emit(PaymentLoading());
    _paymentRepository.getPaymentAuthToken().then((value) {
      debugPrint('[PAYMENT AUTH TOKEN LOADED ====> TOKEN=$value]');
      emit(PaymentAuthTokenLoaded(value));
    });
  }

  void paymentOrderRegistration({required Order order}) {
    _paymentRepository.paymentOrderRegistration(order: order).then((value) {
      debugPrint('[ORDER REGISTRATION DONE ====> ID=$value]');
      emit(PaymentOrderRegistrationDone(value));
    });
  }

  void getFinalPaymentToken(OrderRegistrationDetails orderRegistrationDetails) {
    _paymentRepository
        .getFinalPaymentToken(
            orderRegistrationDetails: orderRegistrationDetails)
        .then((value) {
          debugPrint('[ORDER LAST TOKEN LOADED ====> TOKEN=$value]');
      emit(PaymentFinalTokenLoaded(value));
    });
  }
  void getAuthTokenFromSecureStroage()async{
    await AppSecureStorage.instance.getCurrentUserData(key: AppSecureStorage.authToken).then((value) {
      authToken=value!;
    });

  }
}
