
  import 'package:dio/dio.dart';

final dioClient = Dio(
  BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/api/',
    contentType: Headers.jsonContentType,
    headers: <String, String>{
      'Accept': 'application/json',
    },
  ),
);
