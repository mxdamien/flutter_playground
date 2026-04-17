import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/api_response_error.dart';

abstract class UserDataSource {
  Future<Either<ApiResponseError, List<Map<String, dynamic>>>> getUsers();
}

class UserDataSourceImpl implements UserDataSource {
  final http.Client client;

  UserDataSourceImpl(this.client);

  @override
  Future<Either<ApiResponseError, List<Map<String, dynamic>>>>
  getUsers() async {
    try {
      final response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return Right(data.cast<Map<String, dynamic>>());
      } else {
        return Left(
          ApiResponseError(
            message: 'Server error',
            statusCode: response.statusCode,
          ),
        );
      }
    } on TimeoutException {
      return Left(
        ApiResponseError(message: 'Request timed out', statusCode: 408),
      );
    } catch (e) {
      return Left(
        ApiResponseError(message: 'Unexpected error: $e', statusCode: 0),
      );
    }
  }
}
