part of 'message_bloc.dart';

@immutable
abstract class MessageEvent {
  const MessageEvent();
}

class MessageStarted extends MessageEvent {}

class MessageOnRegisted extends MessageEvent {}
