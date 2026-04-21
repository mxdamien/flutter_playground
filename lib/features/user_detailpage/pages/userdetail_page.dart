import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../domain/usecases/get_user_by_id_usecase.dart';
import '../bloc/userdetail_bloc.dart';
import '../bloc/userdetail_event.dart';
import '../bloc/userdetail_state.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          UserDetailBloc(getIt<GetUserByIdUseCase>())
            ..add(FetchUserDetail(userId)),
      child: Scaffold(
        appBar: AppBar(title: const Text("User Detail")),
        body: BlocBuilder<UserDetailBloc, UserDetailState>(
          builder: (context, state) {
            if (state is UserDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserDetailError) {
              return Center(child: Text(state.message));
            }

            if (state is UserDetailLoaded) {
              final user = state.user;

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text('@${user.username}'),
                    const SizedBox(height: 16),
                    Text('Email: ${user.email}'),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
