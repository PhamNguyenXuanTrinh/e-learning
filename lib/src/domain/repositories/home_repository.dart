  import 'package:elearning/src/domain/models/course_model.dart';

  import '../../core/resources/data_state.dart';

  abstract class CourseRepository {
    Future<DataState<CourseModel?>> getHomeScreen();
  }
