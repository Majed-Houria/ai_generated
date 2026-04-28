import 'package:dio/dio.dart';
import "package:get_it/get_it.dart";

import '../features_pages/data/repository/detect_repository.dart';
import '../features_pages/data/web_services/detect_web_service.dart';
import '../features_pages/logic/detect_image_cubit.dart';
import '../features_pages/logic/detect_text_cubit.dart';
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

  // Repositories
  getIt.registerLazySingleton<DetectRepository>(
    () => DetectRepository(getIt<DetectWebService>()),
  );

  // Cubits
  getIt.registerFactory<DetectImageCubit>(
    () => DetectImageCubit(getIt<DetectRepository>()),
  );
  getIt.registerFactory<DetectTextCubit>(
    () => DetectTextCubit(getIt<DetectRepository>()),
  );

  // Secure Storage Helper
}