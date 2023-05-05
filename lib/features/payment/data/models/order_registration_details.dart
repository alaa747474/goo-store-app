import 'package:goo_store_app/core/constants/end_points.dart';

import 'billing_data.dart';

class OrderRegistrationDetails {
  String? authToken;
  String? amountCents;
  int? expiration;
  String? orderId;
  BillingData? billingData;
  String? currency;
  int? integrationId;

  OrderRegistrationDetails(
      {this.authToken,
      this.amountCents,
      this.expiration=3600,
      this.orderId,
      this.billingData,
      this.currency='EGP',
      this.integrationId=AppEndPoints.paymentIntegrationId});

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auth_token'] = authToken;
    data['amount_cents'] = amountCents;
    data['expiration'] = expiration;
    data['order_id'] = orderId;
    if (billingData != null) {
      data['billing_data'] = billingData!.toJson();
    }
    data['currency'] = currency;
    data['integration_id'] = integrationId;
    return data;
  }
}

