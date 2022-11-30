import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/modules/home/components/user_component.dart';
import 'package:usfranelinha_frontend/src/modules/home/home_controller.dart';
import '../../../shared/components/size_screen.dart';
import 'Item_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(this._homeController, {super.key});
  final HomeController _homeController;
  @override
  Widget build(BuildContext context) {
    Size size = SizeScreen.getSize(context);
    return Container(
      color: Colors.orange[700],
      width: size.width * 0.2,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const UserComponent(),
            const Divider(),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: _homeController.pageSelectedDrawer,
                  builder: ((context, value, child) => ListView.builder(
                        itemCount: _homeController.pages.length,
                        itemBuilder: ((context, index) => ItemDrawer(
                            _homeController.pages[index]['icon'],
                            _homeController.pages[index]['title'],
                            () => _homeController.changePage(index),
                            index == value)),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
