import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/routes/routes.dart';
import 'package:usfranelinha_frontend/src/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usflanelinha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: RoutesApp.routes,
      initialRoute: RoutesName.loginPage,
    );
  }
}
