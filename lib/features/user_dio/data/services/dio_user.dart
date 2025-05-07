import 'package:dio/dio.dart';

//baseUrl: conexión a la api/base de datos/servidor

final Dio DioUser = Dio(
  BaseOptions(
    baseUrl:
        "https://console.firebase.google.com/u/1/project/bootcamp-e2-2025/database/bootcamp-e2-2025-default-rtdb/data/~2F?hl=es-419",
    contentType: 'application/json',
    headers: <String, String>{
      'Accept': 'application/json',
    },
  ),
);

enum HttpMethod { get, post, put, patch, delete }

class ApiUser {
  final Dio dioUser;

  ApiUser({required this.dioUser});

  Future<Response> request({
    required HttpMethod method,
    required String url,
    dynamic body,
  }) async {
    try {
      final result = await dioUser.request(
        url,
        data: body,
        options: Options(
            method: method.name.toUpperCase(), responseType: ResponseType.json),
      );

      return result;
    } on DioException catch (e) {
      return e.response!;
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        statusMessage: 'Error: $e',
        data: 'An unexpected error occurred',
      );
    }
  }
}
