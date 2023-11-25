part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  const HomeLoadSuccess({
    this.homeData,
  });
  final HomeModel? homeData;

  @override
  List<Object?> get props => [
        homeData,
      ];
}

class HomeLoadFailure extends HomeState {
  const HomeLoadFailure(this.apiError);

  final ApiError apiError;

  @override
  List<Object?> get props => [apiError];
}
