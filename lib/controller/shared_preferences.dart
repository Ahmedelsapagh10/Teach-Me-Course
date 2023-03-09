import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tm_course/controller/sign/signGoogle.dart';
import 'package:tm_course/controller/theme/cubit/themeCubit.dart';

import 'sign/shared_sign.dart';

setStartedScreen() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isHome', true);
}

Future<bool> getStartedScreen() async {
  final prefs = await SharedPreferences.getInstance();
  await getEmail();
  await getUserName();
  if (user == null) {
    return false;
  }
  return prefs.getBool('isHome') ?? false;
}

setLogOutScreen() async {
  final pref = await SharedPreferences.getInstance();
  pref.setBool('isHome', false);
  await FirebaseFirestore.instance.terminate();
  await FirebaseFirestore.instance.clearPersistence();
  await FirebaseAuth.instance.signOut();
  await removeDate();
}

////////////
