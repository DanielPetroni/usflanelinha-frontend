import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/model/ticket_model.dart';
import 'package:usfranelinha_frontend/src/repositories/ticket_repository.dart';

import 'ticket_state.dart';

class TicketController extends ValueNotifier<TicketState> {
  TicketController() : super(TicketStart());
  TicketRepository _ticketRepository = TicketRepository();

  void getAllTickets() async {
    value = TicketLoading();
    try {
      Response response = await _ticketRepository.getAllTickets();
      List<Ticket> tickets =
          (response.data as List).map((e) => Ticket.fromJson(e)).toList();
      tickets.sort(((a, b) => a.horaSaida != null ? 1 : -1));
      value = TicketSucess(tickets);
    } catch (e) {
      print(e);
    }
  }

  void finalizeTicket(int idTicket) async {
    try {
      Response response = await _ticketRepository.finalizeTiket(idTicket);
      getAllTickets();
    } catch (e) {
      print(e);
    }
  }
}
