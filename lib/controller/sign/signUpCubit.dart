import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/controller/sign/signUpState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tm_course/view/pages/homescreen.dart';

import '../shared_preferences.dart';
import 'shared_sign.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(InitSignUpState());
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passSignUpController = TextEditingController();
  TextEditingController nameSignUpController = TextEditingController();

  signUpMethod(BuildContext context) async {
    emit(LoadingSignUpState());
    try {
      UserCredential userss =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailSignUpController.text,
        password: passSignUpController.text,
      );
      setStartedScreen();
      user = emailSignUpController.text;
      username = nameSignUpController.text;
      await setEmail();
      await setUserName();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      emit(SucessSignUpState());
      emailSignUpController.clear();
      nameSignUpController.clear();
      passSignUpController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(FailedSignUpState(
            errMessage: 'The password provided is too weak.'));
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(FailedSignUpState(
            errMessage: 'The account already exists for that email.'));
        //  print('The account already exists for that email.');
      }
    } catch (e) {
      emit(FailedSignUpState(errMessage: e.toString()));
      // print(e);
    }
  }

  ///

}
