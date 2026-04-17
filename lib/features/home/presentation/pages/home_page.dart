import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/controllers/l10n_controller.dart';
import '../../../../core/controllers/theme_controller.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/extensions/l10n_context_extension.dart';

import '../../domain/usecases/get_users_usecase.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

import '../widgets/locale_toggle_button.dart';
import '../widgets/theme_mode_toggle_button.dart';
import '../widgets/user_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HomeBloc(getUsers: getIt<GetUsersUseCase>())
            ..add(const EvtFetchUsers()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.l10n.appTitle),
              leading: LocaleToggleButton(
                localeController: getIt<LocaleController>(),
              ),
              actions: [
                ThemeModeToggleButton(
                  themeController: getIt<ThemeController>(),
                ),
              ],
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                switch (state) {
                  case HomeInitial():
                    return Center(child: Text(context.l10n.loadingUsers));

                  case HomeLoading():
                    return const Center(child: CircularProgressIndicator());

                  case HomeError(:final error):
                    return Center(child: Text(error.toString()));

                  case HomeLoaded(:final users):
                    return UserListView(users: users);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
