
import 'package:goo_store_app/features/payment/data/models/order_registration_details.dart';
import 'package:goo_store_app/features/payment/data/models/payment_auth.dart';

import '../models/order.dart';

abstract class BasePaymentRepository {
  Future<PaymentAuth>getPaymentAuthToken();
  Future<int>paymentOrderRegistration({required Order order});
  Future<String>getFinalPaymentToken({required OrderRegistrationDetails orderRegistrationDetails});
}