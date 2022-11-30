import 'package:usfranelinha_frontend/src/model/vacanancy_model.dart';

abstract class VacanancyState {}

class VacancyStateStart extends VacanancyState {}

class VacancyStateLoading extends VacanancyState {}

class VacancyStateSucess extends VacanancyState {
  VacancyStateSucess(this.vacanancys);
  final List<Vacanancy> vacanancys;
}

class VacancyStateError extends VacanancyState {}
