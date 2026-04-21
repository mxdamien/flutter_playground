import 'package:dartz/dartz.dart';

import 'package:flutter_playground/core/errors/api_response_error.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUserByIdUseCase {
  final UserRepository repository;

  GetUserByIdUseCase(this.repository);

  Future<Either<ApiResponseError, UserEntity>> call(int id) {
    return repository.getUser(id);
  }
}
