import 'package:elearning/src/domain/models/my_course_model.dart';
import '../../core/resources/data_state.dart';

abstract class MyCourseRepository {
  Future<DataState<MyCourseModel>> getMyCourseScreen();
}
