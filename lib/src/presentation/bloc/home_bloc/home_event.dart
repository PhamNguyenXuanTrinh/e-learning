part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class HomeStarted extends HomeEvent {}

class HomeOnRegistered extends HomeEvent {

}

