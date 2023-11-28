import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/api_error.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/models/clock_model.dart';
import '../../../domain/repositories/clock_repository.dart';

part 'clock_event.dart';
part 'clock_state.dart';

@injectable
class ClockBloc extends Bloc<ClockEvent, ClockState> {
  ClockBloc(
    this._clockRepository,
  ) : super(ClockInitial()) {
    on<ClockStarted>(_onClockStartedHandler);
  }
  final ClockRepository _clockRepository;

  Future<void> _onClockStartedHandler(
    final ClockStarted event,
    final Emitter<ClockState> emit,
  ) async {
    emit(ClockInProgress());
    final dataState = await _clockRepository.getClocks();
    if (dataState is DataSuccess) {
      emit(
        ClockLoadSuccess(
          clock: dataState?.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(
        ClockLoadFailure(
          ApiError(
              code: dataState?.error?.code, message: dataState?.error?.message),
        ),
      );
    }
  }
}
