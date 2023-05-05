import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/payment/data/models/order.dart';
import 'package:goo_store_app/features/payment/data/models/order_registration_details.dart';
import 'package:goo_store_app/features/payment/data/models/payment_auth.dart';
import 'package:goo_store_app/features/payment/data/repositories/base_payment_repository.dart';

class PaymentRepository extends BasePaymentRepository {
  final DioHelper _dioHelper;
  PaymentRepository(this._dioHelper);
  @override
  Future<PaymentAuth> getPaymentAuthToken() async {
    Response response = await _dioHelper.postData(
        baseUrl: AppEndPoints.paymentBaseUrl,
        endPoint: AppEndPoints.paymentAuth,
        data: {"api_key": AppEndPoints.paymentApiKey});
    return PaymentAuth.fromJson(response.data);
  }

  @override
  Future<int> paymentOrderRegistration({required Order order}) async {
    Response response = await _dioHelper.postData(
        baseUrl: AppEndPoints.paymentBaseUrl,
        endPoint: AppEndPoints.paymentOrder,
        data: order.toJson());
    return response.data['id'];
  }

  @override
  Future<String> getFinalPaymentToken(
      {required OrderRegistrationDetails orderRegistrationDetails}) async {
       late Response response;
  try {
       response = await _dioHelper.postData(
        baseUrl: AppEndPoints.paymentBaseUrl,
        endPoint: AppEndPoints.paymentAcceptance,
        data: orderRegistrationDetails.toString());
  } catch (e) {
    debugPrint('[ERROR ===> $e]');
  }
    return response.data['token'];
  }
}
