part of 'notification_bloc.dart';



@immutable
abstract class NotificationState extends Equatable {
  const NotificationState();
  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationInProgress extends NotificationState {}

class NotificationLoadSuccess extends NotificationState {
  const NotificationLoadSuccess({
    this.Notification,
  });
  final List<NotificationModel>? Notification;

  @override
  List<Object?> get props => [
        Notification,
      ];
}

class NotificationLoadFailure extends NotificationState {
  const NotificationLoadFailure(this.apiError);

  final ApiError apiError;

  @override
  List<Object?> get props => [apiError];
}
