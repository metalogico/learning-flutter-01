import 'package:dio/dio.dart';
import '../../config/app_config.dart';
import '../storage/secure_storage.dart';

class ApiClient {
  late Dio _dio;
  final SecureStorage? _secureStorage;
  bool _isRefreshing = false;

  ApiClient([this._secureStorage]) {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: Duration(milliseconds: AppConfig.connectTimeout),
      receiveTimeout: Duration(milliseconds: AppConfig.receiveTimeout),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ));

    if (AppConfig.debugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        error: true,
      ));
    }

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (_secureStorage != null) {
          final token = await _secureStorage.getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401 && 
            _secureStorage != null && 
            await _secureStorage.hasRefreshToken() &&
            !_isRefreshing) {
          
          try {
            _isRefreshing = true;
            
            final refreshToken = await _secureStorage.getRefreshToken();
            final refreshResponse = await _dio.post('/auth/refresh', data: {
              'refresh_token': refreshToken!,
            });
            
            final responseData = refreshResponse.data;
            await _secureStorage.saveAccessToken(responseData['access_token']);
            await _secureStorage.saveRefreshToken(responseData['refresh_token']);
            
            final originalRequest = error.requestOptions;
            originalRequest.headers['Authorization'] = 'Bearer ${responseData['access_token']}';
            
            final retryResponse = await _dio.fetch(originalRequest);
            handler.resolve(retryResponse);
            
          } catch (refreshError) {
            await _secureStorage.clearTokens();
            handler.next(error);
          } finally {
            _isRefreshing = false;
          }
          
        } else {
          if (error.response?.statusCode == 401) {
            _secureStorage?.clearTokens();
          }
          handler.next(error);
        }
      },
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }

  Future<Response> patch(String path, {dynamic data}) {
    return _dio.patch(path, data: data);
  }

  Future<Response> delete(String path) {
    return _dio.delete(path);
  }
}