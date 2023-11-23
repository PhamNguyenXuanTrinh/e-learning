import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/api_error.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/models/message_model.dart';
import '../../../domain/repositories/message_repository.dart';

part 'message_event.dart';
part 'message_state.dart';

@injectable
class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc(
    this._messageRepository,
  ) : super(MessageInitial()) {
    on<MessageStarted>(_onMessageStartedHandler);
  }
  final MessageRepository _messageRepository;

  Future<void> _onMessageStartedHandler(
    final MessageStarted event,
    final Emitter<MessageState> emit,
  ) async {
    emit(MessageInProgress());
    final dataState = await _messageRepository.getMessages();
    if (dataState is DataSuccess) {
      emit(
        MessageLoadSuccess(
          message: dataState.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(
        MessageLoadFailure(
          ApiError(
              code: dataState.error?.code, message: dataState.error?.message),
        ),
      );
    }
  }
}