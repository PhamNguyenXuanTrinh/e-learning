import 'package:elearning/src/domain/models/home_model.dart';
import '../../core/resources/data_state.dart';

abstract class HomeRepository {
  Future<DataState<HomeModel?>> getHomeScreen();
}
