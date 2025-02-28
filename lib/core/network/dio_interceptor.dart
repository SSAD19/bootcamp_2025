import 'package:dio/dio.dart';

//Ejemplo de interceptores usando Dio
//Interceptores: onRequest, onResponse, onError


class MyInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Agregar un encabezado de autenticación a todas las solicitudes
    options.headers['Authorization'] = 'Bearer YOUR_ACCESS_TOKEN';
    print('Solicitud: ${options.method} ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Respuesta: ${response.statusCode} ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    print('Error: ${error.message}');
    return super.onError(error, handler);
  }
}
/*
void main() {
  final dio = Dio();
  dio.interceptors.add(MyInterceptor());

  // Realizar una solicitud de ejemplo
  dio.get('https://jsonplaceholder.typicode.com/posts/1')
    .then((response) => print('Data: ${response.data}'))
    .catchError((error) => print('Error: $error'));
}*/