import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/model/vacanancy_model.dart';
import 'package:usfranelinha_frontend/src/modules/vacanancy/components/comprovant_ticket.dart';
import 'package:usfranelinha_frontend/src/modules/vacanancy/components/reserve_vacanancy_state.dart';
import 'package:usfranelinha_frontend/src/modules/vacanancy/vacanancy_controller.dart';

import '../../../model/ticket_model.dart';

class ReserveVecanancy extends StatelessWidget {
  ReserveVecanancy(this._vacanancy, this._vacanancyController, {super.key});
  final VacanancyController _vacanancyController;
  final Vacanancy _vacanancy;
  final TextEditingController _textEditingControllerRaUser =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 600,
        width: 700,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dados da vaga: '),
                ],
              ),
              Text('Tipo: ${_vacanancy.tipo}'),
              Text('Nº: ${_vacanancy.numero}'),
              Text('Rua: ${_vacanancy.rua}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dados do aluno: '),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _textEditingControllerRaUser,
                      decoration: InputDecoration(hintText: 'R.A Aluno'),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _vacanancyController.reserveVacanancyState,
                    builder: ((context, value, child) => ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.orange[700]!)),
                          onPressed: () => _vacanancyController
                              .getUserByRa(_textEditingControllerRaUser.text),
                          child: value is ReserveVacanancyStateLoading
                              ? CircularProgressIndicator()
                              : Text('Buscar aluno'),
                        )),
                  )
                ],
              ),
              ValueListenableBuilder(
                valueListenable: _vacanancyController.reserveVacanancyState,
                builder: ((context, value, child) =>
                    value is ReserveVacanancyStateSucess
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Registro acadêmico: ${value.student.ra}'),
                                Text('Nome: ${value.student.nome}'),
                                Text('E-mail: ${value.student.email}'),
                                Text('Telefone:  ${value.student.telefone}'),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.orange[700]!)),
                                  onPressed: () async {
                                    Ticket? ticket = await _vacanancyController
                                        .reserveVaganancy(_vacanancy.id!,
                                            value.student.ra.toString());
                                    if (ticket != null) {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: ((context) =>
                                              ComprovantTicket(ticket)));
                                    }
                                  },
                                  child: const Expanded(
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text('Confirmar reserva'))),
                                )
                              ],
                            ),
                          )
                        : Container()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
