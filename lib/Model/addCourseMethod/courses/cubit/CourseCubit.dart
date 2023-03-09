// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../constants.dart';
// import '../state/CourseState.dart';

// class CourseCubit extends Cubit<CourseState> {
//   CourseCubit() : super(InitState());
//   CollectionReference cppdocReference =
//       FirebaseFirestore.instance.collection('cpp');
//   Future<void> addCppCourse(String title, String id, String coursename) async {
//     return await cppdocReference
//         .add({
//           'id': id,
//           'title': title,
//           'coursename': coursename,
//           kCreatedAt: DateTime.now(),
//         })
//         .then((value) => debugPrint("Note Added"))
//         .catchError((error) => debugPrint("Failed to add Note: $error"));
//   }
// }
