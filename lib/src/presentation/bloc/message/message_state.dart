part of 'message_bloc.dart';

@immutable
abstract class MessageState extends Equatable {
  const MessageState();
  @override
  List<Object?> get props => [];
}

class MessageInitial extends MessageState {}

class MessageInProgress extends MessageState {}

class MessageLoadSuccess extends MessageState {
  const MessageLoadSuccess({
    this.message,
  });
  final List<MessageModel>? message;

  @override
  List<Object?> get props => [
        message,
      ];
}

class MessageLoadFailure extends MessageState {
  const MessageLoadFailure(this.apiError);

  final ApiError apiError;

  @override
  List<Object?> get props => [apiError];
}
