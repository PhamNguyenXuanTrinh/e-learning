 //detail_repository.dart
  import 'package:elearning/src/domain/models/detail_model.dart';

  import '../../core/resources/data_state.dart';

  abstract class DetailCourseRepository {
    Future<DataState<DetailModel>?> getDetailCourses();
  }
