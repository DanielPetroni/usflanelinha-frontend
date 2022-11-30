import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/shared/components/size_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = SizeScreen.getSize(context);
    return Scaffold(
      backgroundColor: Colors.orange[700]?.withOpacity(0.9),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          height: size.height * 0.4,
          width: size.width * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: size.width * 0.2, child: TextFormField()),
                SizedBox(width: size.width * 0.2, child: TextFormField()),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.orange[700]!)),
                    onPressed: () {},
                    child: Text('Entrar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
