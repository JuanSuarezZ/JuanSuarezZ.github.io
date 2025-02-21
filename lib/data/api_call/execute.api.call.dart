import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutterappweb/data/data.config.dart';
import 'package:flutterappweb/domain/api_response.dto.dart';

Future<ApiResponse<T>> makeApiCall<T>({
  required Future<ApiResponse<T>> Function() apiCall,
  required Future<void> Function(ApiResponse<T> response)? onSuccess,
  required Future<void> Function(ApiResponse<T> response)? onError,
}) async {
  ApiResponse<T> apiResponse = await executeApiCall(apiCall);

  if (apiResponse.hasError) {
    log("[ApiCallResponse] [HasError] ${apiResponse.message}");
    await onError?.call(apiResponse);
  } else {
    log("[ApiCallResponse] [Success]");
    await onSuccess?.call(apiResponse);
  }

  return apiResponse;
}

Future<ApiResponse<T>> executeApiCall<T>(
  Future<ApiResponse<T>> Function() apiCall,
) async {
  ApiResponse<T> apiResponse = ApiResponse<T>();

  try {
    apiResponse = await apiCall();
    apiResponse.statusCode = apiResponse.statusCode ?? 200;
    log("[ExecuteApiCall] [Success] ${apiResponse.statusCode}");
  } on DioException catch (dioError) {
    log("[ExecuteApiCall] [Error] ${dioError.message}");
    // Manejar errores de tipo Dio
    apiResponse.error = ErrorHandler.dioException(error: dioError);
    apiResponse.statusCode = dioError.response?.statusCode;
    apiResponse.message =
        dioError.response?.data['message'] ?? "Error desconocido";
  } catch (e) {
    log("[ExecuteApiCall] [Error Catch] $e");
    // Manejar otros tipos de errores
    apiResponse.statusCode = apiResponse.statusCode ?? 500;
    apiResponse.error = ErrorHandler.otherException();
    apiResponse.message = "Ha ocurrido un error inesperado.";
  }

  return apiResponse;
}
