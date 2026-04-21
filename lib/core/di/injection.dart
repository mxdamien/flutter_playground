import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../data/datasources/user_datasource_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/data/user_datasource.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/get_user_by_id_usecase.dart';
import '../../domain/usecases/get_users_usecase.dart';
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
  getIt.registerLazySingleton<GetUserByIdUseCase>(
    () => GetUserByIdUseCase(getIt()),
  );
}
