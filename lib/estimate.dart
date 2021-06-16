import 'package:estimate/base/routes.dart';
import 'package:flutter/material.dart';

class EstimateApp extends StatelessWidget {
  const EstimateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: EstimateRoutes.estimateRoutes,
      initialRoute: EstimateRoutes.SIGN_SCREEN,
    );
  }
}
