import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:goo_store_app/features/payment/data/models/order.dart';
import 'package:goo_store_app/features/payment/data/models/order_registration_details.dart';
import 'package:goo_store_app/features/payment/data/models/payment_auth.dart';
import 'package:goo_store_app/features/payment/data/repositories/payment_repository.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._paymentRepository) : super(PaymentInitial());
  final PaymentRepository _paymentRepository;
  late String authToken;
  Future<void> getPaymentAuthToken() async {
    emit(PaymentLoading());
    final data = await _paymentRepository.getPaymentAuthToken();data.fold((error) {
      emit(PaymentFailure(error.errorMessage));
    }, (authToken) {
      debugPrint('[PAYMENT AUTH TOKEN LOADED ====> TOKEN=$authToken]');
      emit(PaymentAuthTokenLoaded(authToken));
    });
  }

  Future<void> paymentOrderRegistration({required OrderModel order}) async {
    final data =await _paymentRepository.paymentOrderRegistration(order: order);
    data.fold((error) {
      emit(PaymentFailure(error.errorMessage));
    }, (orderId) {
      debugPrint('[ORDER REGISTRATION DONE ====> ID=$orderId]');
      emit(PaymentOrderRegistrationDone(orderId));
    });
  }

  Future<void> getFinalPaymentToken(
      OrderRegistrationDetails orderRegistrationDetails) async {
    final data = await _paymentRepository.getFinalPaymentToken(orderRegistrationDetails: orderRegistrationDetails);
    data.fold((error) {
      emit(PaymentFailure(error.errorMessage));
    }, (finalToken) {
      debugPrint('[ORDER LAST TOKEN LOADED ====> TOKEN=$finalToken]');
      emit(PaymentFinalTokenLoaded(finalToken));
    });
  }
}
