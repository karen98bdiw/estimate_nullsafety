import 'package:dio/dio.dart';
import 'package:estimate/base/endpoints_and_headers.dart';

class DioConfig {
  static Dio initDio() {
    var dio = Dio(BaseOptions(
      baseUrl: EstimatesEndposintAndHeaders.BASE_URL,
      connectTimeout: 20000,
      receiveTimeout: 20000,
      validateStatus: (status) {
        return true;
      },
    ));

    return dio;
  }
}
