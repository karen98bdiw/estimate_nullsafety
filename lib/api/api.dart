import 'package:dio/dio.dart';
import 'package:estimate/api/auth/auth.dart';

class EstimateApi {
  static EstimateApi? _singltone;

  final AuthApi? authApi;

  EstimateApi._internal({
    this.authApi,
  });

  factory EstimateApi({Dio? dio}) {
    return _singltone = _singltone ??
        EstimateApi._internal(
          authApi: AuthApi(dio: dio),
        );
  }
}
