import 'package:estimate/api/api.dart';
import 'package:estimate/api/auth/auth.dart';
import 'package:estimate/models/sign/register_request_model.dart';

class AuthManager {
  Future<String?> register(RegisterRequestModel model) async {
    RegisterResponse? res = await EstimateApi().authApi!.register(model);
    print(res);
    return "null";
  }
}
