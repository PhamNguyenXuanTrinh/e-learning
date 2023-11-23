part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent {
  const NotificationEvent();
}

class NotificationStarted extends NotificationEvent {}

class NotificationOnRegisted extends NotificationEvent {}
