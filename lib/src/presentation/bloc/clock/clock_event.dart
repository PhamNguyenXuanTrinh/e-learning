part of '../clock/clock_bloc.dart';

@immutable
abstract class ClockEvent {
  const ClockEvent();
}

class ClockStarted extends ClockEvent {}

class ClockOnRegisted extends ClockEvent {}
