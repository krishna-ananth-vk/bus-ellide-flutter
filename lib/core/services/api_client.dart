import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 10)));

  Future<Response> post(String url, Map<String, dynamic> body) async {
    return dio.post(url, data: body);
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.get(url, queryParameters: queryParameters);
  }
}
