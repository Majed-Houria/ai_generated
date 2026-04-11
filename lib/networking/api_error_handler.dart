import 'dart:io';
import 'package:dio/dio.dart';

class ErrorHandler {
  final String? message;
  final int? statusCode;
  final Map<String, dynamic>? fieldErrors;

  ErrorHandler(this.message, {this.statusCode, this.fieldErrors});

  static ErrorHandler handle(dynamic error) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode;
      final data = error.response?.data;

      const List<String> generalMessageKeys = ['detail', 'error', 'message'];

      ErrorHandler handleErrorResponse(
        int statusCode,
        Map<String, dynamic> data,
      ) {
        String? generalMessage;
        final fieldErrors = <String, dynamic>{};

        if (data.length == 1 && data.values.first != null) {
          final value = data.values.first;
          if (value is List && value.isNotEmpty) {
            generalMessage = value.first.toString();
          } else {
            generalMessage = value.toString();
          }
        } else {
          for (var key in generalMessageKeys) {
            if (data.containsKey(key)) {
              final value = data[key];
              if (value is List && value.isNotEmpty) {
                generalMessage = value.first.toString();
              } else if (value != null) {
                generalMessage = value.toString();
              }
              break;
            }
          }
        }

        data.forEach((key, value) {
          if (!generalMessageKeys.contains(key) &&
              key != 'errors' &&
              value != null) {
            if (value is List) {
              fieldErrors[key] = List<String>.from(
                value.map((e) => e.toString()),
              );
            } else if (value is String) {
              fieldErrors[key] = [value];
            }
          }
        });

        if (data.containsKey('errors') &&
            data['errors'] is Map<String, dynamic>) {
          final rawErrors = data['errors'] as Map<String, dynamic>;
          rawErrors.forEach((key, value) {
            if (value is List) {
              fieldErrors[key] = List<String>.from(
                value.map((e) => e.toString()),
              );
            } else if (value != null) {
              fieldErrors[key] = [value.toString()];
            }
          });
        }

        return ErrorHandler(
          generalMessage ?? 'الرجاء إعادة المحاولة لاحقا',
          statusCode: statusCode,
          fieldErrors: fieldErrors.isNotEmpty ? fieldErrors : null,
        );
      }

      if (statusCode != null &&
          data is Map<String, dynamic> &&
          (statusCode == 400 || statusCode == 404)) {
        return handleErrorResponse(statusCode, data);
      }

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ErrorHandler(
            "انتهت المهلة. يُرجى المحاولة مرة أخرى.",
            statusCode: statusCode,
          );
        case DioExceptionType.badResponse:
          return ErrorHandler(
            "خطأ في الخادم. يُرجى المحاولة لاحقًا.",
            statusCode: statusCode,
          );
        case DioExceptionType.cancel:
          return ErrorHandler(
            "تم إلغاء الطلب. يُرجى المحاولة لاحقًا.",
            statusCode: statusCode,
          );
        case DioExceptionType.badCertificate:
          return ErrorHandler("يُرجى المحاولة لاحقًا.", statusCode: statusCode);
        case DioExceptionType.unknown:
        default:
          if (error.error is SocketException) {
            return ErrorHandler("لا يوجد اتصال بالإنترنت.");
          }
          return ErrorHandler("حدث خطأ ما. يُرجى المحاولة مرة أخرى.");
      }
    }
    return ErrorHandler("حدث خطأ غير متوقع.");
  }

  @override
  String toString() => message ?? 'حدث خطأ ما. يُرجى المحاولة مرة أخرى.';
}
