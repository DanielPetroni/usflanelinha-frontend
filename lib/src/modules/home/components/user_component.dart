import 'package:flutter/material.dart';

class UserComponent extends StatelessWidget {
  const UserComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(80),
              ),
              color: Colors.white),
          child: const Center(
            child: Text('D', style: TextStyle(fontSize: 28)),
          ),
        ),
        const Text(
          'Daniel Petroni',
          style: TextStyle(fontSize: 22),
        ),
        const Icon(Icons.logout)
      ],
    );
  }
}
