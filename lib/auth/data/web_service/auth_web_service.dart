import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../networking/api_constants.dart';
import '../models/login.dart';
import '../models/register.dart';

part 'auth_web_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AuthWebService {
  factory AuthWebService(Dio dio, {String? baseUrl}) = _AuthWebService;

  @POST(ApiConstants.register)
  Future<Register> register(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.login)
  Future<Login> login(@Body() Map<String, dynamic> body);
}
