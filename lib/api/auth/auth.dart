import 'package:dio/dio.dart';
import 'package:estimate/base/endpoints_and_headers.dart';
import 'package:estimate/models/sign/register_request_model.dart';

class AuthApi {
  final Dio? dio;
  AuthApi({this.dio});

  Future<RegisterResponse?> register(RegisterRequestModel model) async {
    try {
      Response res = await dio!.post(
        EstimatesEndposintAndHeaders.linkWithBase(
            EstimatesEndposintAndHeaders.REGISTER_ENDPOINT),
        data: model.toJson(),
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "client-id": "application/client",
          },
        ),
      );

      print("REGISTER RESPONSE ${res.data}");
    } catch (e) {
      print("ERROR IN REGISTER CATCH ${e.toString()}");
    }
    return null;
  }
}

class RegisterResponse {
  String? statusCode;
  bool? succses;
  String? errorMessage;

  RegisterResponse({this.errorMessage, this.statusCode, this.succses});
}
