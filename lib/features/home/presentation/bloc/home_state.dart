import '../../../../core/errors/base_error.dart';
import '../../domain/entities/user_entity.dart';

sealed class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<UserEntity> users;

  HomeLoaded(this.users);
}

class HomeError extends HomeState {
  final BaseError error;

  const HomeError(this.error);
}
