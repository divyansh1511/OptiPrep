abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String uid_pss;
  LoginSuccessState(this.uid_pss);
}

class LoginErrorState extends LoginStates {
  final String error_msg;

  LoginErrorState(this.error_msg);
}
