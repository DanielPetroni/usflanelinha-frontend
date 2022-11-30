import 'package:dio/dio.dart';
import 'package:usfranelinha_frontend/src/shared/constants.dart';

class EmployeeRepository {
  final Dio _dio = Dio();

  Future<Response> auth(String email, String password) async {
    Response _response = await _dio.post(
      "$baseUrl/login",
      data: {"email": email, "password": password},
    );
    return _response;
  }
}
