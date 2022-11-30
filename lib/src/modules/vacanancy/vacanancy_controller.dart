import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/model/student_model.dart';
import 'package:usfranelinha_frontend/src/model/ticket_model.dart';
import 'package:usfranelinha_frontend/src/model/vacanancy_model.dart';
import 'package:usfranelinha_frontend/src/modules/vacanancy/components/reserve_vacanancy_state.dart';
import 'package:usfranelinha_frontend/src/repositories/student_repository.dart';
import 'package:usfranelinha_frontend/src/repositories/ticket_repository.dart';
import 'package:usfranelinha_frontend/src/repositories/vacancy_repository.dart';

import 'vacanancy_state.dart';

class VacanancyController extends ValueNotifier<VacanancyState> {
  VacanancyController() : super(VacancyStateStart());
  final VacanacyRepository _vacanacyRepository = VacanacyRepository();
  final TicketRepository _ticketRepository = TicketRepository();
  final StudentRepository _studentRepository = StudentRepository();

  ValueNotifier<ReserveVacanancyState> reserveVacanancyState =
      ValueNotifier<ReserveVacanancyState>(ReserveVacanancyStateStart());

  Future<void> getAllVacanancys() async {
    value = VacancyStateLoading();
    try {
      Response response = await _vacanacyRepository.getAllVacanancys();
      List<Vacanancy> vacanancys =
          (response.data as List).map((e) => Vacanancy.fromJson(e)).toList();
      vacanancys.sort(((a, b) => a.active! ? -1 : 1));
      value = VacancyStateSucess(vacanancys);
    } catch (e) {
      value = VacancyStateError();
    }
  }

  Future<Ticket?> reserveVaganancy(int idVaga, String raUser) async {
    try {
      Response response =
          await _ticketRepository.generateTicket(idVaga, raUser);
      reserveVacanancyState.value = ReserveVacanancyStateStart();
      getAllVacanancys();
      return Ticket.fromJson(response.data);
    } catch (e) {
      value = VacancyStateError();
    }
    return null;
  }

  Future<void> getUserByRa(String idRa) async {
    try {
      reserveVacanancyState.value = ReserveVacanancyStateLoading();
      Response response = await _studentRepository.getStudentByRa(idRa);
      Student _student = Student.fromJson(response.data);
      reserveVacanancyState.value = ReserveVacanancyStateSucess(_student);
    } catch (e) {
      reserveVacanancyState.value = ReserveVacanancyStateError();
    }
  }
}
