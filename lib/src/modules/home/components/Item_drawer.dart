import 'package:flutter/material.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer(this.icon, this.title, this.onTap, this.isSelected,
      {super.key});
  final String title;
  final Icon icon;
  final Function onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? Colors.white.withOpacity(0.8) : null,
      child: ListTile(
        onTap: () => onTap(),
        leading: icon,
        title: Text(title),
      ),
    );
  }
}
