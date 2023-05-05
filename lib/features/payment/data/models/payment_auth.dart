class PaymentAuth {
  final String token;
  PaymentAuth(this.token);
  factory PaymentAuth.fromJson(Map<String, dynamic> map) {
    return PaymentAuth(
      map['token'] ?? '',
    );
  }
}
