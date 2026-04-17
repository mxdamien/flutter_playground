import 'package:flutter_playground/core/errors/base_error.dart';

class ApiResponseError extends BaseError {
  final String message;
  final int? statusCode;

  ApiResponseError({required this.message, this.statusCode});

  @override
  String toString() {
    if (statusCode != null) {
      return 'ApiResponseError: $message (Status Code: $statusCode)';
    }
    return 'ApiResponseError: $message';
  }
}
