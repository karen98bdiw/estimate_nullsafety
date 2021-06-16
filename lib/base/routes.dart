import 'package:estimate/presentation/ui/pages/auth/login_screen.dart';
import 'package:estimate/presentation/ui/pages/auth/register_screen.dart';
import 'package:estimate/presentation/ui/pages/auth/sign_screen.dart';

class EstimateRoutes {
  static const SIGN_SCREEN = "/sign";
  static const LOGIN_SCREEN = "/login";
  static const REGISTER_SCREEN = "/register";

  static final estimateRoutes = {
    SIGN_SCREEN: (c) => SignScreen(),
    LOGIN_SCREEN: (c) => LoginScreen(),
    REGISTER_SCREEN: (c) => RegisterScreen()
  };
}
