import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/modules/vacanancy/vacanancy_controller.dart';
import 'package:usfranelinha_frontend/src/modules/vacanancy/vacanancy_state.dart';

import 'components/reserve_vacanancy.dart';

class VacanancyScreen extends StatefulWidget {
  const VacanancyScreen({super.key});

  @override
  State<VacanancyScreen> createState() => _VacanancyScreenState();
}

class _VacanancyScreenState extends State<VacanancyScreen> {
  final VacanancyController _vacanancyController = VacanancyController();
  @override
  void initState() {
    super.initState();
    _vacanancyController.getAllVacanancys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: _vacanancyController,
      builder: ((context, value, child) => value is VacancyStateLoading
          ? Center(child: CircularProgressIndicator())
          : value is VacancyStateSucess
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: value.vacanancys.length,
                      itemBuilder: (context, index) => Container(
                            height: 50,
                            padding: EdgeInsets.all(20),
                            color: value.vacanancys[index].active!
                                ? Colors.green.withOpacity(0.5)
                                : Colors.red.withOpacity(0.5),
                            child: SizedBox(
                              height: 20,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tipo: ${value.vacanancys[index].tipo}'),
                                  Text('Nº: ${value.vacanancys[index].numero}'),
                                  Text('Rua: ${value.vacanancys[index].rua}'),
                                  Text(
                                      'Status: ${value.vacanancys[index].active! ? 'Disponivel' : 'Indisponivel'}'),
                                  value.vacanancys[index].active!
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(Colors
                                                                .orange[700]!)),
                                                onPressed: () => showDialog(
                                                    context: context,
                                                    builder: ((context) =>
                                                        ReserveVecanancy(
                                                            value.vacanancys[
                                                                index],
                                                            _vacanancyController))),
                                                child: Text('Efetuar reserva'))
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
