import 'package:dio/dio.dart';

class ViaCEP {
  final _dio = Dio();

  Dio get dio => _dio;

  ViaCEP() {
    _dio.options.baseUrl = "https://viacep.com.br/ws";
  }
}