import 'package:dio/dio.dart';
import 'package:usfranelinha_frontend/src/shared/constants.dart';

class TicketRepository {
  final Dio _dio = Dio();

  Future<Response> generateTicket(int idVaga, String raAluno) async {
    Map<String, dynamic> data = {
      "aluno": {"ra": raAluno},
      "vaga": {"id": idVaga}
    };
    Response _response = await _dio.post("$baseUrl/tickets", data: data);
    return _response;
  }

  Future<Response> getAllTickets() async {
    Response _response = await _dio.get("$baseUrl/tickets");
    return _response;
  }

  Future<Response> finalizeTiket(int idTicker) async {
    Response _response =
        await _dio.put("$baseUrl/tickets/$idTicker/finalizacao");
    return _response;
  }
}
