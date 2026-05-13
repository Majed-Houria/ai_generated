import 'package:ai_generated/features_pages/data/models/detect_image.dart';
import 'package:ai_generated/features_pages/data/models/detect_text.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../networking/api_constants.dart';
import '../models/detect_video.dart';
import '../models/histories_image.dart';
import '../models/histories_text.dart';
import '../models/histories_video.dart';

part 'detect_web_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class
DetectWebService{
  factory DetectWebService(Dio dio, {String? baseUrl}) = _DetectWebService;

  @POST(ApiConstants.detectImage)
  Future<DetectImage> detectImage(@Body() FormData body);

  @POST(ApiConstants.detectVideo)
  Future<DetectVideo> detectVideo(@Body() FormData body);

  @POST(ApiConstants.detectText)
  Future<DetectText> detectText(@Body() Map<String, dynamic> body);

  @GET(ApiConstants.historiesImage)
  Future<List<HistoriesImage>> historiesImage();

  @GET(ApiConstants.historiesVideo)
  Future<List<HistoriesVideo>> historiesVideo();

  @GET(ApiConstants.historiesText)
  Future<List<HistoriesText>> historiesText();
}
