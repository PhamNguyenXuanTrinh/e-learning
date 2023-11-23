import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/api_error.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/models/notification_model.dart';
import '../../../domain/repositories/notification_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(
    this._NotificationRepository,
  ) : super(NotificationInitial()) {
    on<NotificationStarted>(_onNotificationStartedHandler);
  }
  final NotificationRepository _NotificationRepository;

  Future<void> _onNotificationStartedHandler(
    final NotificationStarted event,
    final Emitter<NotificationState> emit,
  ) async {
    emit(NotificationInProgress());
    final dataState = await _NotificationRepository.getNotifications();
    if (dataState is DataSuccess) {
      emit(
        NotificationLoadSuccess(
          notification: dataState.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(
        NotificationLoadFailure(
          ApiError(
              code: dataState.error?.code, message: dataState.error?.message),
        ),
      );
    }
  }
}
