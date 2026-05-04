import 'package:dio/dio.dart';
import "package:get_it/get_it.dart";

import '../auth/data/repository/auth_repository.dart';
import '../auth/data/web_service/auth_web_service.dart';
import '../auth/logic/login_cubit.dart';
import '../auth/logic/register_cubit.dart';
import '../features_pages/data/repository/detect_repository.dart';
import '../features_pages/data/web_services/detect_web_service.dart';
import '../features_pages/logic/detect_image_cubit.dart';
import '../features_pages/logic/detect_text_cubit.dart';
import '../features_pages/logic/detect_video_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  final dioInstance = await DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dioInstance);

  // Web Services
  getIt.registerLazySingleton<DetectWebService>(
    () => DetectWebService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthWebService>(() => AuthWebService(getIt<Dio>()));


  // Repositories
  getIt.registerLazySingleton<DetectRepository>(
    () => DetectRepository(getIt<DetectWebService>()),
  );
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<AuthWebService>()));


  // Cubits
  getIt.registerFactory<DetectImageCubit>(
    () => DetectImageCubit(getIt<DetectRepository>()),
  );
  getIt.registerFactory<DetectVideoCubit>(
        () => DetectVideoCubit(getIt<DetectRepository>()),
  );
  getIt.registerFactory<DetectTextCubit>(
    () => DetectTextCubit(getIt<DetectRepository>()),
  );

  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt<AuthRepository>()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<AuthRepository>()));


  // Secure Storage Helper
}