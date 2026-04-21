import 'package:dartz/dartz.dart';

import '../../core/errors/api_response_error.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<ApiResponseError, List<UserEntity>>> getUsers();
  Future<Either<ApiResponseError, UserEntity>> getUser(int id);
}
