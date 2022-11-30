abstract class LoginState {}

class LoginStateStart extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSucefful extends LoginState {}

class LoginStateError extends LoginState {
  LoginStateError(this.error);
  String error;
}
