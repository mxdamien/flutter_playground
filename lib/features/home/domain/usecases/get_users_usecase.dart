import 'package:dartz/dartz.dart';

import 'package:flutter_playground/core/errors/api_response_error.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<Either<ApiResponseError, List<UserEntity>>> call() {
    return repository.getUsers();
  }
}
