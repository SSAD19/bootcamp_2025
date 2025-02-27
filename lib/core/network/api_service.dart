import 'package:dio/dio.dart';
import 'api_result.dart';

enum HttpMethod { get, post, put, patch, delete }

class ApiService {
  final Dio dioClient;

  ApiService(this.dioClient);

  Future<ApiResult> request({
    required HttpMethod method,
    required String url,
    dynamic body,
  }) async {
    try {
      final result = await dioClient.request(
        url,
        data: body,
        options: Options(
            method: method.name.toUpperCase(), responseType: ResponseType.json),
      );

      return ApiResult.success(
        body: result.data,
        statusCode: result.statusCode,
      );
    } on DioException catch (e) {
      return ApiResult.failure(
        body: e.response?.data,
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResult.error();
    }
  }
}