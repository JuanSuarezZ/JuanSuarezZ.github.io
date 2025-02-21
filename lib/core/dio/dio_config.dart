import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterappweb/core/dio/app_interceptor.dart';
import 'package:flutterappweb/core/dio/app_transformer.dart';

class DioConfig {
  static Dio init(String apiUrl) {
    const int connectTimeout = 10000;
    const int receiveTimeout = 10000;
    const int sendTimeout = 10000;

    final BaseOptions options = BaseOptions(
      baseUrl: apiUrl,
      sendTimeout: const Duration(milliseconds: sendTimeout),
      connectTimeout: const Duration(milliseconds: connectTimeout),
      receiveTimeout: const Duration(milliseconds: receiveTimeout),
    );

    final dio = Dio(options);

    dio.interceptors.add(
      LogInterceptor(
        error: true,
        responseHeader: false,
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        logPrint: _debugPrint,
      ),
    );

    dio.interceptors.add(AppInterceptor());

    dio.transformer = AppTransformer();

    return dio;
  }
}

void _debugPrint(Object? object) {
  assert(() {
    if (kDebugMode) {
      print(object.toString());
    }
    return true;
  }());
}
