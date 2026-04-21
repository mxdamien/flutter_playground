import '../../../domain/entities/user_entity.dart';

abstract class UserDetailState {
  const UserDetailState();
}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoading extends UserDetailState {}

class UserDetailLoaded extends UserDetailState {
  final UserEntity user;

  const UserDetailLoaded(this.user);
}

class UserDetailError extends UserDetailState {
  final String message;

  const UserDetailError(this.message);
}
