import 'package:elearning/src/domain/models/home_model.dart';
import 'package:elearning/src/domain/repositories/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/api_error.dart';
import '../../../core/resources/data_state.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._homeRepository,
  ) : super(HomeInitial()) {
    on<HomeStarted>(_onHomeStartedHandler);
  }
  final HomeRepository _homeRepository;

  Future<void> _onHomeStartedHandler(
    final HomeStarted event,
    final Emitter<HomeState> emit,
  ) async {
    emit(HomeInProgress());
    final dataState = await _homeRepository.getHomeScreen();
    if (dataState is DataSuccess) {
      emit(
        HomeLoadSuccess(
          homeData: dataState.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(
        HomeLoadFailure(
          ApiError(
              code: dataState.error?.code, message: dataState.error?.message),
        ),
      );
    }
  }
}