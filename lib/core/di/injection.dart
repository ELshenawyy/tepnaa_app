import 'package:get_it/get_it.dart';
import 'package:login_screen/features/auth/data/repo/auth_repository_impl.dart';
import 'package:login_screen/features/auth/domain/repo/auth_repository.dart';
import 'package:login_screen/features/intro/presentation/cubit/splash_cubit.dart';
import 'package:login_screen/features/search/presentation/cubit/search_cubit.dart';
import 'package:login_screen/features/specialties/cubit/specialties_cubit.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/domain/usecases/sign_in_usecase.dart';
import '../../features/auth/presentation/cubit/login_cubit.dart';
import '../network/api_client.dart';

final sl = GetIt.instance;

void setupDependencies() {
  // ── Core ──────────────────────────────────────
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(baseUrl: 'https://api.tibna.com/api/v1'),
  );

  // ── Data Sources ──────────────────────────────
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: sl()),
  );

  // ── Repositories ─────────────────────────────
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // ── Use Cases ─────────────────────────────────
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // ── Cubits ────────────────────────────────────
  sl.registerFactory(
    () => LoginCubit(signInUseCase: sl()),
  );
  sl.registerFactory(() => SplashCubit());

  sl.registerFactory(() => SearchCubit());

  sl.registerFactory(() => SpecialtiesCubit());
}
