import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutterappweb/core/dio/dio_config.dart';
import 'package:flutterappweb/core/injection/injection.priorities.dart';
import 'package:flutterappweb/data/api/api.dart';

@Order(InjectionPriority.module)
@module
abstract class RegisterModule {
  @singleton
  Dio baseDio() => DioConfig.init("http://192.168.101.29:8000/api");

  @singleton
  RestClient api() => RestClient(baseDio());
}
