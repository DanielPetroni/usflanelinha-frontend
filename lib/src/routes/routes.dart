import 'package:flutter/cupertino.dart';
import 'package:usfranelinha_frontend/src/modules/home/home_screen.dart';
import 'package:usfranelinha_frontend/src/modules/login/login_screen.dart';
import 'package:usfranelinha_frontend/src/modules/ticket/ticket_screen.dart';
import 'package:usfranelinha_frontend/src/modules/vacanancy/vacanancy_screen.dart';
import 'package:usfranelinha_frontend/src/routes/routes_name.dart';

abstract class RoutesApp {
  static Map<String, WidgetBuilder> routes = {
    RoutesName.homePage: (context) => const HomeScreen(),
    RoutesName.ticketPage: (context) => const TicketScreen(),
    RoutesName.vacanancyPage: (context) => const VacanancyScreen(),
    RoutesName.loginPage: (context) => const LoginScreen(),
  };
}
