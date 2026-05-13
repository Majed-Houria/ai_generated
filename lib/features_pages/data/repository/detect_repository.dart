import 'package:dio/dio.dart';

import '../../../../networking/api_error_handler.dart';
import '../../../../networking/api_result.dart';
import '../models/detect_image.dart';
import '../models/detect_text.dart';
import '../models/detect_video.dart';
import '../models/histories_image.dart';
import '../models/histories_text.dart';
import '../models/histories_video.dart';
import '../web_services/detect_web_service.dart';

class DetectRepository {
  final DetectWebService detectWebService;

  DetectRepository(this.detectWebService);

  Future<ApiResult<DetectImage>> detectImage(FormData body) async {
    try {
      final result = await detectWebService.detectImage(body);

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<DetectVideo>> detectVideo(FormData body) async {
    try {
      final result = await detectWebService.detectVideo(body);

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<DetectText>> detectText(Map<String, dynamic> body) async {
    try {
      final result = await detectWebService.detectText(body);

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<HistoriesImage>>> historiesImage() async {
    try {
      final result = await detectWebService.historiesImage();

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<HistoriesVideo>>> historiesVideo() async {
    try {
      final result = await detectWebService.historiesVideo();

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<HistoriesText>>> historiesText() async {
    try {
      final result = await detectWebService.historiesText();

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}