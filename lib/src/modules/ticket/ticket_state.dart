import '../../model/ticket_model.dart';

abstract class TicketState {}

class TicketStart extends TicketState {}

class TicketLoading extends TicketState {}

class TicketSucess extends TicketState {
  TicketSucess(this.tickets);
  List<Ticket> tickets;
}
