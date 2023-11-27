import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/api_error.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/models/payment_model.dart';
import '../../../domain/repositories/payment_repository.dart';

part 'payment_event.dart';
part 'payment_state.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(
    this._paymentRepository,
  ) : super(PaymentInitial()) {
    on<PaymentStarted>(_onPaymentStartedHandler);
  }
  final PaymentRepository _paymentRepository;

  Future<void> _onPaymentStartedHandler(
    final PaymentStarted event,
    final Emitter<PaymentState> emit,
  ) async {
    emit(PaymentInProgress());
    final dataState = await _paymentRepository.getPayments();
    if (dataState is DataSuccess) {
      emit(
        PaymentLoadSuccess(
          payment: dataState?.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(
        PaymentLoadFailure(
          ApiError(
              code: dataState?.error?.code, message: dataState?.error?.message),
        ),
      );
    }
  }
}
