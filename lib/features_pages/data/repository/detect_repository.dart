import 'package:dio/dio.dart';

import '../../../../networking/api_error_handler.dart';
import '../../../../networking/api_result.dart';
import '../models/detect_image.dart';
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
}
