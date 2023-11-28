import '../../core/resources/data_state.dart';
import '../models/clock_model.dart';

abstract class ClockRepository {
    Future<DataState<ClockModel>?> getClocks();
  }
