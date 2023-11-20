// Project imports:
import 'package:path_to_regexp/path_to_regexp.dart';

import '../end_points.dart';

final Map<String, String> mapMockApiForGetRequest = <String, String>{
  EndPoints.course: 'course',
};

final Map<String, String> mapMockApiForPostRequest = <String, String>{};

String? getJsonNameForGetRequest(
  final String endpoint, {
  final Map<String, dynamic>? queryParameters,
}) {
  for (final key in mapMockApiForGetRequest.keys) {
    if (hasMatch(endpoint, key)) {
      return mapMockApiForGetRequest[key];
    }
  }

  return endpoint;
}

String? getJsonNameForPostRequest(
  final String endpoint, {
  // ignore: avoid_annotating_with_dynamic
  final dynamic data,
  final Map<String, dynamic>? queryParameters,
}) {
  for (final key in mapMockApiForPostRequest.keys) {
    if (hasMatch(endpoint, key)) {
      return mapMockApiForPostRequest[key];
    }
  }

  return endpoint;
}

bool hasMatch(final String path, final String endPoints) {
  final endPoint = endPoints.replaceAll('{', ':').replaceAll('}', '');
  final regExp = pathToRegExp(endPoint);

  return regExp.hasMatch(path);
}
