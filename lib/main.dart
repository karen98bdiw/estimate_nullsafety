import 'package:dio/dio.dart';
import 'package:estimate/api/api.dart';
import 'package:estimate/estimate.dart';
import 'package:estimate/utils/configs/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> run() async {
  //Init flutter
  WidgetsFlutterBinding.ensureInitialized();

  //Set device orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  //Create instance of dio client;
  Dio dio = DioConfig.initDio();

  //Initialize api base singltion

  EstimateApi(dio: dio);

  //Run app
  runApp(EstimateApp());
}

Future<void> main() async => await run();
