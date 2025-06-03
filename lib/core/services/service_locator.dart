import 'package:get_it/get_it.dart';
import 'package:smartapi/core/apis/api_calls.dart';
import 'package:smartapi/features/auth/data/repositories/auth_repositories.dart';
import 'package:smartapi/features/auth/data/sources/auth_data_sources.dart';

class ServiceLocator {
  static GetIt getIt = GetIt.instance;

  static setupServiceLocator() {
    getIt.registerLazySingleton<ApiCalls>(() => ApiCalls());
    getIt.registerLazySingleton<AuthDataSources>(
      () => AuthDataSourcesImpl(apiCalls: getIt<ApiCalls>()),
    );
    getIt.registerLazySingleton<AuthRepositories>(
      () => AuthRepositoriesImpl(authDataSources: getIt<AuthDataSources>()),
    );
    // Add more services as needed of rgister if you need to register them
  }
}
