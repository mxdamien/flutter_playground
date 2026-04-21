import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_user_by_id_usecase.dart';
import 'userdetail_event.dart';
import 'userdetail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetUserByIdUseCase getUserById;

  UserDetailBloc(this.getUserById) : super(UserDetailInitial()) {
    on<FetchUserDetail>(_onFetchUserDetail);
  }

  Future<void> _onFetchUserDetail(
    FetchUserDetail event,
    Emitter<UserDetailState> emit,
  ) async {
    emit(UserDetailLoading());

    final result = await getUserById(event.userId);

    result.fold(
      (error) {
        emit(UserDetailError(error.message));
      },
      (user) {
        emit(UserDetailLoaded(user));
      },
    );
  }
}
