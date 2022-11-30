import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/modules/ticket/ticket_screen.dart';
import 'package:usfranelinha_frontend/src/modules/vacanancy/vacanancy_screen.dart';

class HomeController {
  ValueNotifier<int> pageSelectedDrawer = ValueNotifier<int>(0);
  final List<Map<String, dynamic>> pages = [
    {
      'icon': const Icon(Icons.car_rental),
      'title': 'Vagas',
      'page': const VacanancyScreen()
    },
    {
      'icon': const Icon(Icons.document_scanner),
      'title': 'Tickets',
      'page': const TicketScreen()
    },

    // {
    //   'icon': const Icon(Icons.manage_accounts),
    //   'title': 'Usuários',
    //   'page': const TicketScreen()
    // },
  ];

  void changePage(int index) {
    pageSelectedDrawer.value = index;
  }
}
