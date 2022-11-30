import 'package:flutter/material.dart';
import 'package:usfranelinha_frontend/src/model/employee_model.dart';
import 'package:usfranelinha_frontend/src/modules/login/login_controller.dart';
import 'package:usfranelinha_frontend/src/modules/login/login_state.dart';
import 'package:usfranelinha_frontend/src/routes/routes_name.dart';
import 'package:usfranelinha_frontend/src/shared/components/size_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerPassword =
      TextEditingController();
  LoginController _loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    Size size = SizeScreen.getSize(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: size.height,
              width: size.width,
              child: Image.asset(
                'assets/images/estacionamento.jpg',
                fit: BoxFit.cover,
              )),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.all(
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width: size.width * 0.2,
                        child: TextFormField(
                          controller: _textEditingControllerEmail,
                          decoration: InputDecoration(hintText: 'E-mail'),
                        )),
                    SizedBox(
                        width: size.width * 0.2,
                        child: TextFormField(
                            controller: _textEditingControllerPassword,
                            decoration: InputDecoration(hintText: 'Senha'))),
                    SizedBox(
                      width: size.width * 0.15,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.orange[700]!)),
                          onPressed: () async {
                            Employee? employee = await _loginController.auth(
                                _textEditingControllerEmail.text,
                                _textEditingControllerPassword.text);
                            if (employee != null) {
                              Navigator.pushReplacementNamed(
                                  context, RoutesName.homePage);
                            }
                          },
                          child: ValueListenableBuilder(
                              valueListenable: _loginController,
                              builder: (context, LoginState value, child) =>
                                  value is LoginStateLoading
                                      ? const CircularProgressIndicator()
                                      : const Text('Entrar'))),
                    ),
                    ValueListenableBuilder(
                        valueListenable: _loginController,
                        builder: ((context, LoginState value, child) =>
                            value is LoginStateError
                                ? Text(
                                    value.error,
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Container()))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
