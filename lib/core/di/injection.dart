import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../features/home/data/datasources/user_datasource.dart';
import '../../features/home/data/repositories/user_repository_impl.dart';
import '../../features/home/domain/repositories/user_repository.dart';
import '../../features/home/domain/usecases/get_users_usecase.dart';
import '../controllers/l10n_controller.dart';
import '../controllers/theme_controller.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Global Controllers
  getIt.registerLazySingleton<LocaleController>(() => LocaleController());
  getIt.registerLazySingleton<ThemeController>(() => ThemeController());

  //  External
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // DataSource
  getIt.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt()),
  );

  // UseCase
  getIt.registerLazySingleton<GetUsersUseCase>(() => GetUsersUseCase(getIt()));
}
