//mock_api.dart
// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart';

// Project imports:
import 'map_mockup_api.dart';

class MockApi {
  static Future<Map<String, dynamic>?> get(
    final String endpoint, {
    final Map<String, dynamic>? queryParameters,
  }) async {
    return mock(
      getJsonNameForGetRequest(
        endpoint,
        queryParameters: queryParameters,
      ),
    );
  }

  static Future<Map<String, dynamic>?> post(
    final String endpoint, {
    // ignore: avoid_annotating_with_dynamic
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
  }) async {
    return mock(
      getJsonNameForPostRequest(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  static Future<Map<String, dynamic>?> mock(final String? endpoint) async {
    // the way how to load assets in packages
    final responseStr =
        await rootBundle.loadString('assets/mockup/$endpoint.json');
    final responseJson = json.decode(responseStr) as Map<String, dynamic>?;

    return responseJson;
  }
}
