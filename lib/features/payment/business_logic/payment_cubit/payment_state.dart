part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentAuthTokenLoaded extends PaymentState {
  final PaymentAuth paymentAuthToken;
  PaymentAuthTokenLoaded(this.paymentAuthToken);
}

class PaymentOrderRegistrationDone extends PaymentState {
  final int id;
  PaymentOrderRegistrationDone(this.id);
}

class PaymentFinalTokenLoaded extends PaymentState {
  final String paymentFinalTokenLoaded;

  PaymentFinalTokenLoaded(this.paymentFinalTokenLoaded);
}
class PaymentFailure extends PaymentState {
 final String error;

  PaymentFailure(this.error); 
}