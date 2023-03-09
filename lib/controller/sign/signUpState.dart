abstract class SignUpState {}

class InitSignUpState extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class SucessSignUpState extends SignUpState {}

class FailedSignUpState extends SignUpState {
  final String errMessage;
  FailedSignUpState({required this.errMessage});
}
