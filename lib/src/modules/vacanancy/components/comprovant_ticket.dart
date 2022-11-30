import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import 'package:usfranelinha_frontend/src/model/ticket_model.dart';

class ComprovantTicket extends StatelessWidget {
  const ComprovantTicket(this.ticket, {super.key});
  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 400,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Nº Vaga: ${ticket.vaga?.numero}'),
            Text('Nº Rua: ${ticket.vaga?.rua}'),
            Text('Aluno: ${ticket.aluno?.nome}'),
            Text('Entrada: ${ticket.horaEntrada}'),
            Text('Saída: ${ticket.horaSaida ?? ''}'),
            BarcodeWidget(
              barcode: Barcode.code128(),
              data: ticket.codigo.toString(),
            )
          ],
        ),
      ),
    );
  }
}
