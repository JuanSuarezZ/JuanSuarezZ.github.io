import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error.handler.g.dart';

@JsonSerializable()
class ErrorHandler implements Exception {
  String errorMessage = "";

  ErrorHandler(this.errorMessage);

  ErrorHandler.dioException({required DioException error}) {
    _handleDioException(error);
  }

  ErrorHandler.otherException() {
    _handleOtherException();
  }

  getErrorMessage() {
    return errorMessage;
  }

  _handleOtherException() {
    errorMessage = "Algo salió mal";
    ErrorHandler serverError = ErrorHandler(errorMessage);
    return serverError;
  }

  //error will be network related
  _handleDioException(DioException error) {
    ErrorHandler serverError;
    switch (error.type) {
      case DioExceptionType.cancel:
        errorMessage = "Error de cancelación";
        serverError = ErrorHandler(errorMessage);
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = "Error de tiempo de espera";
        serverError = ErrorHandler(errorMessage);
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Error de tiempo de espera";
        serverError = ErrorHandler(errorMessage);
        break;
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 503) {
          errorMessage = "Error de servidor";
          serverError = ErrorHandler(errorMessage);
        } else if (error.response?.statusCode != 401) {
          errorMessage = handleBadRequest(error.response?.data);
          serverError = ErrorHandler(errorMessage);
        } else {
          errorMessage = "Error de servidor";
          serverError = ErrorHandler(errorMessage);
        }
        break;
      case DioExceptionType.unknown:
        errorMessage = "Error desconocido";
        serverError = ErrorHandler(errorMessage);
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Error de tiempo de espera";
        serverError = ErrorHandler(errorMessage);
        break;
      case DioExceptionType.connectionError:
        errorMessage = "Error de conexión";
        serverError = ErrorHandler(errorMessage);
        break;
      default:
        errorMessage = error.response?.statusMessage ?? "Algo salió mal";
        serverError = ErrorHandler(errorMessage);
        break;
    }
    return serverError;
  }

  String handleBadRequest(Map<String, dynamic>? errorData) {
    String error = "";
    if (errorData?['error_description'] != null) {
      final message = errorData?['error_description'];
      error = message;
    } else if (errorData?['error'] != null) {
      try {
        final errorObject = errorData?['error'];
        final message = errorObject['message'];
        final dynamic errorTag = message.keys.first;
        error = message[errorTag];
      } catch (e) {
        error = errorData?['error']['message'] ?? "";
      }
    } else if (errorData?['errors'] == null && errorData?.entries != null) {
      for (var item in errorData!.entries) {
        error = item.value.toString();
        break;
      }
    } else {
      error = "Algo salió mal";
    }

    return error;
  }

  factory ErrorHandler.fromJson(Map<String, dynamic> json) =>
      _$ErrorHandlerFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorHandlerToJson(this);
}
