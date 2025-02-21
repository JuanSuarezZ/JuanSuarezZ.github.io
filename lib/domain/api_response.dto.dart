import 'package:flutterappweb/data/errors/error.handler.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.dto.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  T? data;
  String? message;
  String? status;
  int? statusCode;
  ErrorHandler? error;

  ApiResponse({
    this.data,
    this.status,
    this.message,
    this.statusCode,
    this.error,
  });

  @override
  String toString() {
    return "Data: $data \nMessage: $message \nStatus: $status \nError: ${error?.toJson()} \nStatusCode: $statusCode \nTypeData: ${T.toString()}";
  }

  factory ApiResponse.fromError(ErrorHandler error) {
    return ApiResponse(error: error);
  }

  bool get hasError => error != null;

  ApiResponse copyWith({
    T? data,
    String? message,
    String? status,
    int? statusCode,
    ErrorHandler? error,
  }) {
    return ApiResponse(
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  /// Método `fromJson` para deserializar JSON a una instancia de ApiResponse.
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  /// Método `toJson` para serializar la instancia a JSON.
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
