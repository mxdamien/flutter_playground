import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/errors/api_response_error.dart';
import '../../domain/data/user_datasource.dart';

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

  @override
  Future<Either<ApiResponseError, Map<String, dynamic>>> getUserById(
    int id,
  ) async {
    try {
      final response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        return Right(data);
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
