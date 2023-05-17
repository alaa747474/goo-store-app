
import 'package:dartz/dartz.dart';
import 'package:goo_store_app/core/errors/failures.dart';
import 'package:goo_store_app/features/payment/data/models/order_registration_details.dart';
import 'package:goo_store_app/features/payment/data/models/payment_auth.dart';

import '../models/order.dart';

abstract class BasePaymentRepository {
  Future<Either<Failure,PaymentAuth>> getPaymentAuthToken();
  Future<Either<Failure,int>>paymentOrderRegistration({required OrderModel order});
  Future<Either<Failure,String>>getFinalPaymentToken({required OrderRegistrationDetails orderRegistrationDetails});
}