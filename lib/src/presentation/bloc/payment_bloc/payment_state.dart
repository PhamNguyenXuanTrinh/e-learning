part of 'payment_bloc.dart';

@immutable
abstract class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentInProgress extends PaymentState {}

class PaymentLoadSuccess extends PaymentState {
  const PaymentLoadSuccess({
    this.payment,
  });
  final PaymentModel? payment;

  @override
  List<Object?> get props => [
        payment,
      ];
}

class PaymentLoadFailure extends PaymentState {
  const PaymentLoadFailure(this.apiError);

  final ApiError apiError;

  @override
  List<Object?> get props => [apiError];
}
