abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final String uid_pss;
  SignUpSuccessState(this.uid_pss);
}

class SignUpErrorState extends SignUpStates {
  final String error_msg;

  SignUpErrorState(this.error_msg);
}
