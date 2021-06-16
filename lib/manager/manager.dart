import 'package:estimate/manager/auth/auth.dart';

class EstimateManager {
  static EstimateManager? _singltone;

  AuthManager? authManager;

  EstimateManager._internal({this.authManager});

  factory EstimateManager() {
    return _singltone = _singltone ??
        EstimateManager._internal(
          authManager: AuthManager(),
        );
  }
}
