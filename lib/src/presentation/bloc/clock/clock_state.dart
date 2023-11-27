part of '../clock/clock_bloc.dart';

@immutable
abstract class ClockState extends Equatable {
  const ClockState();
  @override
  List<Object?> get props => [];
}

class ClockInitial extends ClockState {}

class ClockInProgress extends ClockState {}

class ClockLoadSuccess extends ClockState {
  const ClockLoadSuccess({
    this.clock,
  });
  final ClockModel? clock;

  @override
  List<Object?> get props => [
        clock,
      ];
}

class ClockLoadFailure extends ClockState {
  const ClockLoadFailure(this.apiError);

  final ApiError apiError;

  @override
  List<Object?> get props => [apiError];
}
