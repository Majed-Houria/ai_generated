import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../storage/secure_storage_token.dart';
import 'api_constants.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;

  static Future<Dio> getDio() async {
    if (_dio != null) return _dio!;

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    );
    final storage = SecureStorageToken();

    _dio!.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          return handler.next(error);
        },
      ),
    );

    if (kDebugMode) {
      _dio!.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          requestBody: true,
        ),
      );
    }
    return _dio!;
  }
}
