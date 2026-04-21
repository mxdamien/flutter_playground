import 'dart:async';
import 'package:dartz/dartz.dart';

import '../../core/errors/api_response_error.dart';

abstract class UserDataSource {
  Future<Either<ApiResponseError, List<Map<String, dynamic>>>> getUsers();
  Future<Either<ApiResponseError, Map<String, dynamic>>> getUserById(int id);
}
