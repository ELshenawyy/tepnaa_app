import 'package:dio/dio.dart';
import 'package:login_screen/core/errors/exeptions.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({required String baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    _dio.interceptors.add(_AuthInterceptor());
  }

  Dio get dio => _dio;
}

class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException('انتهت مهلة الاتصال');
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode == 401) throw UnauthorizedException('غير مصرح لك');
        if (statusCode == 422 || statusCode == 400) {
          final message = err.response?.data['message'] ?? 'بيانات غير صحيحة';
          throw ServerException(message);
        }
        throw ServerException('حدث خطأ في الخادم');
      default:
        throw NetworkException('تحقق من اتصالك بالإنترنت');
    }
  }
}