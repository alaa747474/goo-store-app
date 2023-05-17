import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/errors/server_error.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/payment/data/models/order.dart';
import 'package:goo_store_app/features/payment/data/models/order_registration_details.dart';
import 'package:goo_store_app/features/payment/data/models/payment_auth.dart';
import 'package:goo_store_app/features/payment/data/repositories/base_payment_repository.dart';

import '../../../../core/errors/failures.dart';

class PaymentRepository extends BasePaymentRepository {
  final DioHelper _dioHelper;
  PaymentRepository(this._dioHelper);
  @override
  Future<Either<Failure, PaymentAuth>> getPaymentAuthToken() async {
    try {
      Response response = await _dioHelper.postData(
          baseUrl: AppEndPoints.paymentBaseUrl,
          endPoint: AppEndPoints.paymentAuth,
          data: {"api_key": AppEndPoints.paymentApiKey});
      return right(PaymentAuth.fromJson(response.data));
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> paymentOrderRegistration(
      {required OrderModel order}) async {
    try {
      Response response = await _dioHelper.postData(
          baseUrl: AppEndPoints.paymentBaseUrl,
          endPoint: AppEndPoints.paymentOrder,
          data: order.toJson());
      return right(response.data['id']);
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getFinalPaymentToken(
      {required OrderRegistrationDetails orderRegistrationDetails}) async {
    try {
      Response response = await _dioHelper.postData(
          baseUrl: AppEndPoints.paymentBaseUrl,
          endPoint: AppEndPoints.paymentAcceptance,
          data: orderRegistrationDetails.toJson());
      return right(response.data['token']);
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
