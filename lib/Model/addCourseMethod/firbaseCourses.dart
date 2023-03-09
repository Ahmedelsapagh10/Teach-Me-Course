// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tm_course/Model/cppData.dart';
// import 'package:tm_course/Model/dartData.dart';
// import 'package:tm_course/Model/addCourseMethod/courses/cubit/CourseCubit.dart';
// import 'package:tm_course/Model/addCourseMethod/courses/state/CourseState.dart';

// import '../../constants.dart';

// class FBC extends StatefulWidget {
//   const FBC({super.key});

//   @override
//   State<FBC> createState() => _FBCState();
// }

// class _FBCState extends State<FBC> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CourseCubit, CourseState>(builder: (context, state) {
//       var controller = BlocProvider.of<CourseCubit>(context);
//       return Scaffold(
//         floatingActionButton: FloatingActionButton(
//             onPressed: () async {
//               for (int i = 0; i < cplusplusCourse.length; i++) {
//                 await controller.addCppCourse(
//                     cplusplusCourse[i].title, cplusplusCourse[i].id, 'cpp');
//               }
//             },
//             child: Text('dart')),
//         body: FutureBuilder(
//             future: controller.cppdocReference.orderBy(kCreatedAt).get(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return const Center(child: Text("Something went wrong"));
//               }
//               if (snapshot.hasData) {
//                 return Container(
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           child: Text(snapshot.data!.docs[index]['title']),
//                         );
//                       }),
//                 );
//               }

//               if (snapshot.connectionState == ConnectionState.done) {
//                 Map<String, dynamic> data =
//                     snapshot.data! as Map<String, dynamic>;
//                 return Text("task is : ${data['task']}");
//               }

//               return const Center(
//                   child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: CircularProgressIndicator(),
//               ));
//             }),
//       );
//     });
//   }
// }
