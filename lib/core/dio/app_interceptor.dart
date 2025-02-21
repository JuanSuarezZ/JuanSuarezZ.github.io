import 'package:dio/dio.dart';

class AppInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data == null) {
      return handler.next(response);
    } else {
      return handler.next(response);
    }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.next(
      DioException(
        error: err.error,
        message: err.message,
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
      ),
    );
  }
}
