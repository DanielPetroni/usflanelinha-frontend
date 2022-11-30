import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:usfranelinha_frontend/src/model/employee_model.dart';
import 'package:usfranelinha_frontend/src/modules/login/login_state.dart';
import 'package:usfranelinha_frontend/src/repositories/employee_repository.dart';

class LoginController extends ValueNotifier<LoginState> {
  final EmployeeRepository _employeeRepository = EmployeeRepository();
  LoginController() : super(LoginStateStart());

  Future<Employee?> auth(String email, String password) async {
    value = LoginStateLoading();
    try {
      Response response = await _employeeRepository.auth(email, password);
      return Employee.fromJson(response.data);
    } on DioError catch (e) {
      value = LoginStateError(e.response?.data['error']);
    }
    return null;
  }
}
