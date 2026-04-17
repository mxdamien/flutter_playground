import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_users_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUsersUseCase _getUsers;

  HomeBloc({required GetUsersUseCase getUsers})
    : _getUsers = getUsers,
      super(const HomeInitial()) {
    on<EvtFetchUsers>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(
    EvtFetchUsers event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    final result = await _getUsers();

    result.fold(
      (error) => emit(HomeError(error)),
      (users) => emit(HomeLoaded(users)),
    );
  }
}
