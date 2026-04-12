import 'package:ai_generated/features_pages/data/models/detect_image.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../networking/api_constants.dart';

part 'detect_web_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class
DetectWebService{
  factory DetectWebService(Dio dio, {String? baseUrl}) = _DetectWebService;

  @POST(ApiConstants.detectImage)
  Future<DetectImage> detectImage(@Body() FormData body);
}
