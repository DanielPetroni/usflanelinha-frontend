import 'package:usfranelinha_frontend/src/model/student_model.dart';
import 'package:usfranelinha_frontend/src/model/vacanancy_model.dart';

class Ticket {
  int? codigo;
  Student? aluno;
  Vacanancy? vaga;
  String? horaEntrada;
  String? horaSaida;
  String? status;

  Ticket(
      {this.codigo,
      this.aluno,
      this.vaga,
      this.horaEntrada,
      this.horaSaida,
      this.status});

  Ticket.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    aluno = json['aluno'] != null ? Student.fromJson(json['aluno']) : null;
    vaga = json['vaga'] != null ? Vacanancy.fromJson(json['vaga']) : null;
    horaEntrada = json['horaEntrada'];
    horaSaida = json['horaSaida'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codigo'] = codigo;
    if (aluno != null) {
      data['aluno'] = aluno!.toJson();
    }
    if (vaga != null) {
      data['vaga'] = vaga!.toJson();
    }
    data['horaEntrada'] = horaEntrada;
    data['horaSaida'] = horaSaida;
    data['status'] = status;
    return data;
  }
}
