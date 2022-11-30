import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/modules/home/components/custom_drawer.dart';
import 'package:usfranelinha_frontend/src/modules/home/home_controller.dart';
import 'package:usfranelinha_frontend/src/shared/components/size_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    Size size = SizeScreen.getSize(context);
    return Scaffold(
      body: Row(
        children: [
          CustomDrawer(_homeController),
          ValueListenableBuilder(
            valueListenable: _homeController.pageSelectedDrawer,
            builder: ((context, value, child) => Expanded(
                  child: _homeController.pages[value]['page'],
                )),
          )
        ],
      ),
    );
  }
}
