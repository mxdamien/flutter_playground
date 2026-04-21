import 'package:dartz/dartz.dart';

import '../../core/errors/api_response_error.dart';
import '../../domain/data/user_datasource.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<Either<ApiResponseError, List<UserEntity>>> getUsers() async {
    final result = await dataSource.getUsers();
    return result.fold(
      (error) => Left(error),
      (data) => Right(data.map((json) => UserModel.fromJson(json)).toList()),
    );
  }

  @override
  Future<Either<ApiResponseError, UserEntity>> getUser(int id) async {
    final result = await dataSource.getUserById(id);
    return result.fold(
      (error) => Left(error),
      (data) => Right(UserModel.fromJson(data)),
    );
  }
}
