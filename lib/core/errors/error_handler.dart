import 'package:dio/dio.dart';
import 'app_exception.dart';

class ErrorHandler {
  static AppException handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('Timeout di connessione');

      case DioExceptionType.badResponse:
        return _handleHttpError(e);

      case DioExceptionType.cancel:
        return NetworkException('Richiesta annullata');

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return NetworkException('Errore di connessione');

      default:
        return NetworkException('Errore di rete sconosciuto');
    }
  }

  static AppException _handleHttpError(DioException e) {
    final statusCode = e.response?.statusCode ?? 0;
    final responseData = e.response?.data;

    switch (statusCode) {
      case 400:
        return ValidationException(
          responseData?['message'] ?? 'Richiesta non valida',
          _parseFieldErrors(responseData),
        );

      case 401:
        return AuthException();

      case 404:
        return NotFoundException('Risorsa');

      case 422:
        // Laravel Validation Error - Parsing specifico
        return ValidationException(
          responseData?['message'] ?? 'Errori di validazione',
          _parseFieldErrors(responseData),
        );

      case 500:
        return ServerException(
          statusCode,
          responseData?['message'] ?? 'Errore interno del server',
        );

      default:
        return ServerException(
          statusCode,
          responseData?['message'] ?? 'Errore del server',
        );
    }
  }

  // Parsing degli errori Laravel validation format
  static Map<String, List<String>>? _parseFieldErrors(dynamic responseData) {
    if (responseData == null) return null;

    final errors = responseData['errors'];
    if (errors == null) return null;

    if (errors is Map<String, dynamic>) {
      return errors.map((key, value) {
        if (value is List) {
          return MapEntry(key, value.cast<String>());
        } else if (value is String) {
          return MapEntry(key, [value]);
        }
        return MapEntry(key, [value.toString()]);
      });
    }

    return null;
  }
}