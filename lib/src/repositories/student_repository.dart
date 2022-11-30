import 'package:dio/dio.dart';
import 'package:usfranelinha_frontend/src/shared/constants.dart';

class StudentRepository {
  final Dio _dio = Dio();

  Future<Response> getStudentByRa(String raAluno) async {
    Response _response = await _dio.get("$baseUrl/alunos/$raAluno");
    return _response;
  }
}
