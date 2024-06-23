import 'package:dio/dio.dart';

class Api {
  static final dio = Dio(
    BaseOptions(baseUrl: "https://phonechakra.com/api/", headers: {
      'Accept': 'application/json',
      'Content-type': 'application/json'
    }),
  );
}
