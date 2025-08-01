abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException([String? message]) : super(message ?? 'Errore di connessione');
}

class ServerException extends AppException {
  ServerException(int statusCode, [String? message])
    : super(message ?? 'Errore del server', statusCode);
}

class AuthException extends AppException {
  AuthException() : super('Sessione scaduta', 401);
}

class ValidationException extends AppException {
  final Map<String, List<String>>? fieldErrors;

  ValidationException(String message, [this.fieldErrors]) : super(message, 422);

  // Helper methods per UI
  bool hasFieldError(String field) => fieldErrors?.containsKey(field) ?? false;

  List<String> getFieldErrors(String field) => fieldErrors?[field] ?? [];

  String? getFirstFieldError(String field) {
    final errors = getFieldErrors(field);
    return errors.isNotEmpty ? errors.first : null;
  }

  bool get hasAnyFieldErrors => fieldErrors?.isNotEmpty ?? false;

  Map<String, String> get firstErrorPerField {
    if (fieldErrors == null) return {};

    return fieldErrors!.map((field, errors) =>
      MapEntry(field, errors.isNotEmpty ? errors.first : ''));
  }
}

class NotFoundException extends AppException {
  NotFoundException(String resource) : super('$resource non trovato', 404);
}