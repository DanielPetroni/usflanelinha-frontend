import 'package:dio/dio.dart';
import 'package:usfranelinha_frontend/src/shared/constants.dart';

class VacanacyRepository {
  final Dio _dio = Dio();

  Future<Response> getAllVacanancys() async {
    Response _response = await _dio.get("$baseUrl/vagas");
    return _response;
  }
}
