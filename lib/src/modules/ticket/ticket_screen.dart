import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/modules/ticket/ticket_controller.dart';
import 'package:usfranelinha_frontend/src/modules/ticket/ticket_state.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final TicketController _ticketController = TicketController();
  @override
  void initState() {
    super.initState();
    _ticketController.getAllTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: _ticketController,
      builder: ((context, value, child) => value is TicketLoading
          ? Center(child: CircularProgressIndicator())
          : value is TicketSucess
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: value.tickets.length,
                      itemBuilder: (context, index) => Container(
                            height: 50,
                            color: Colors.grey.withOpacity(0.4),
                            padding: EdgeInsets.all(20),
                            child: SizedBox(
                              height: 20,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Código: ${value.tickets[index].codigo}'),
                                  Text(
                                      'Nº Vaga: ${value.tickets[index].vaga?.numero}'),
                                  Text(
                                      'Nº Rua: ${value.tickets[index].vaga?.rua}'),
                                  Text(
                                      'Aluno: ${value.tickets[index].aluno?.nome}'),
                                  Text(
                                      'Entrada: ${value.tickets[index].horaEntrada}'),
                                  Text(
                                      'Saída: ${value.tickets[index].horaSaida ?? ''}'),
                                  value.tickets[index].horaSaida == null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          Colors.orange[700]!)),
                                              onPressed: () => _ticketController
                                                  .finalizeTicket(value
                                                      .tickets[index].codigo!),
                                              child:
                                                  const Text('Encerrar ticket'),
                                            ),
                                          ],
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          )),
                )
              : Container()),
    ));
  }
}
