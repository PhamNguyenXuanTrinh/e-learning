//Network.dart
// Project imports:
import '../../utils/constants/app_config.dart';
import 'api_provider.dart';

class Network {
  factory Network({
    required final bool enableLogger,
    required final Future<Map<String, dynamic>> Function()
        getHeadersApiProvider,
  }) {
    return Network._init(
      enableLogger: enableLogger,
      getHeadersApiProvider: getHeadersApiProvider,
    );
  }

  Network._init({
    required this.enableLogger,
    required this.getHeadersApiProvider,
  }) {
    apiProvider = ApiProvider(
      baseUrl: AppConfig.baseUrl,
      enableLogger: enableLogger,
      getHeaders: getHeadersApiProvider,
    );
  }

  final bool enableLogger;

  final Future<Map<String, dynamic>> Function() getHeadersApiProvider;

  late ApiProvider apiProvider;
}
