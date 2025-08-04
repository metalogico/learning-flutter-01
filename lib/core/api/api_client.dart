import 'package:dio/dio.dart';
import '../../config/app_config.dart';
import '../storage/local_storage.dart';

class ApiClient {
  late Dio _dio;
  final LocalStorage? _localStorage;
  bool _isRefreshing = false;

  ApiClient([this._localStorage]) {
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

    // Interceptor per gestione automatica del token e refresh
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Aggiungi automaticamente il Bearer token se disponibile
        if (_localStorage != null) {
          final token = _localStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        // Se è un errore 401 e abbiamo un refresh token, prova il refresh
        if (error.response?.statusCode == 401 && 
            _localStorage != null && 
            _localStorage.hasRefreshToken &&
            !_isRefreshing) {
          
          try {
            _isRefreshing = true;
            
            // Prova il refresh
            final refreshToken = _localStorage.getRefreshToken()!;
            final refreshResponse = await _dio.post('/auth/refresh', data: {
              'refresh_token': refreshToken,
            });
            
            // Salva i nuovi token
            final responseData = refreshResponse.data;
            await _localStorage.saveToken(responseData['access_token']);
            await _localStorage.saveRefreshToken(responseData['refresh_token']);
            
            // Riprova la chiamata originale con il nuovo token
            final originalRequest = error.requestOptions;
            originalRequest.headers['Authorization'] = 'Bearer ${responseData['access_token']}';
            
            final retryResponse = await _dio.fetch(originalRequest);
            handler.resolve(retryResponse);
            
          } catch (refreshError) {
            // Il refresh è fallito, pulisci i dati e passa l'errore originale
            _localStorage.clearAuthData();
            handler.next(error);
          } finally {
            _isRefreshing = false;
          }
          
        } else {
          // Non è un 401 o non abbiamo refresh token
          if (error.response?.statusCode == 401) {
            _localStorage?.clearAuthData();
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