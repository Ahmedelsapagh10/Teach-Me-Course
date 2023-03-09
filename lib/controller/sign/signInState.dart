abstract class SignInState {}

class InitSignInState extends SignInState {}

class LoadingSignInState extends SignInState {}

class SucessSignInState extends SignInState {}

class FailedSignInState extends SignInState {
  final String errMessage;
  FailedSignInState({required this.errMessage});
}
