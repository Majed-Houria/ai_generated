import '../../../networking/api_error_handler.dart';
import '../../../networking/api_result.dart';
import '../models/login.dart';
import '../models/register.dart';
import '../web_service/auth_web_service.dart';

class AuthRepository {
  final AuthWebService authWebService;

  AuthRepository(this.authWebService);

  Future<ApiResult<Register>> register(Map<String, dynamic> body) async {
    try {
      final result = await authWebService.register(body);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<Login>> login(Map<String, dynamic> body) async {
    try {
      final result = await authWebService.login(body);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

}
