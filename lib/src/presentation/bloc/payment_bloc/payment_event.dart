part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {
  const PaymentEvent();
}

class PaymentStarted extends PaymentEvent {}

class PaymentOnRegisted extends PaymentEvent {}
