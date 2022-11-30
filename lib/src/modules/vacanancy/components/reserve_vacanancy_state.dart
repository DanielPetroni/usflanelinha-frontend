import 'package:usfranelinha_frontend/src/model/student_model.dart';

abstract class ReserveVacanancyState {}

class ReserveVacanancyStateStart extends ReserveVacanancyState {}

class ReserveVacanancyStateLoading extends ReserveVacanancyState {}

class ReserveVacanancyStateSucess extends ReserveVacanancyState {
  ReserveVacanancyStateSucess(this.student);
  final Student student;
}

class ReserveVacanancyStateError extends ReserveVacanancyState {}
