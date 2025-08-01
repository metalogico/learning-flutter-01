import 'package:dio/dio.dart';
import '../../config/app_config.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: Duration(milliseconds: AppConfig.connectTimeout),
      receiveTimeout: Duration(milliseconds: AppConfig.receiveTimeout),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ));

    // Debug logging solo in development
    if (AppConfig.debugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        error: true,
      ));
    }
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) {
    return _dio.put(path, data: data);
  }

  Future<Response> delete(String path) {
    return _dio.delete(path);
  }
}