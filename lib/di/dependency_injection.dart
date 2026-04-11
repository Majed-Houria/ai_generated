import 'package:dio/dio.dart';

import "package:get_it/get_it.dart";

import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  final dioInstance = await DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dioInstance);

  // Web Services

  // Repositories

  // Cubits

  // Secure Storage Helper
}