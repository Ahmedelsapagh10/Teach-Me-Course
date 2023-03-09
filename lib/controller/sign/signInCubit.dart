import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/controller/sign/signInState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tm_course/view/pages/homescreen.dart';

import '../shared_preferences.dart';
import 'shared_sign.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(InitSignInState());
  TextEditingController emailSignInController = TextEditingController();
  TextEditingController passSignInController = TextEditingController();
  TextEditingController nameSignInController = TextEditingController();

  signInMethod(BuildContext context) async {
    emit(LoadingSignInState());
    try {
      UserCredential users =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailSignInController.text,
        password: passSignInController.text,
      );
      setStartedScreen();
      user = emailSignInController.text;
      username = nameSignInController.text;
      await setEmail();
      await setUserName();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));

      emit(SucessSignInState());
      emailSignInController.clear();
      nameSignInController.clear();
      passSignInController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(FailedSignInState(errMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(FailedSignInState(errMessage: 'wrong-password'));
      }
    } catch (e) {
      emit(FailedSignInState(errMessage: e.toString()));
    }
  }
}
