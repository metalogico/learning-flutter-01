import 'package:dio/dio.dart';
import '../../config/app_config.dart';
import '../storage/local_storage.dart';

class ApiClient {
  late Dio _dio;
  final LocalStorage? _localStorage;

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

    // Interceptor per gestione automatica del token
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
      onError: (error, handler) {
        // Gestione automatica degli errori di autenticazione
        if (error.response?.statusCode == 401) {
          // Token scaduto o non valido - pulisci i dati locali
          _localStorage?.clearAuthData();
          // Qui potresti anche triggerare un redirect al login
          // ma per ora lasciamo che sia gestito a livello di UI
        }
        handler.next(error);
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