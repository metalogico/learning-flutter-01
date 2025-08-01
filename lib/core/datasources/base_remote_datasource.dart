import 'package:dio/dio.dart';
import '../api/api_client.dart';
import '../errors/error_handler.dart';
import '../errors/app_exception.dart';

abstract class BaseRemoteDataSource {
  final ApiClient apiClient;

  BaseRemoteDataSource(this.apiClient);

  // Metodo generico - NON sa niente delle strutture specifiche
  Future<T> handleRequest<T>(
    Future<Response> request,
    T Function(dynamic) parser,
  ) async {
    try {
      final response = await request;

      // Passa TUTTA la response.data alla feature specifica
      // La feature decide come parsarla
      return parser(response.data);
    } on DioException catch (e) {
      throw ErrorHandler.handleDioException(e);
    } catch (e) {
      throw NetworkException('Errore sconosciuto: $e');
    }
  }

  // Metodo per DELETE (senza response body)
  Future<void> handleVoidRequest(Future<Response> request) async {
    try {
      await request;
    } on DioException catch (e) {
      throw ErrorHandler.handleDioException(e);
    } catch (e) {
      throw NetworkException('Errore sconosciuto: $e');
    }
  }
}
