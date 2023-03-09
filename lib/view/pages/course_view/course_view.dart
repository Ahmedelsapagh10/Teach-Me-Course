import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/constants.dart';
import 'package:tm_course/view/pages/videoPlayer.dart';

import '../../../controller/theme/cubit/themeCubit.dart';
import '../../../controller/theme/cubit/themeState.dart';

import '../../widgets/itemwidget.dart';
import '../../widgets/sliver_app_bar.dart';

class CourseView extends StatelessWidget {
  String image;
  int courseFinished;
  String courseName;
  // List<VideoModel> courseList;
  CourseView(
      {required this.image,
      required this.courseName,
      required this.courseFinished,
      super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference courseRef =
        FirebaseFirestore.instance.collection(courseName);

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              MySliverAppBar(image: image),

              SliverToBoxAdapter(
                child: FutureBuilder<QuerySnapshot>(
                    future: courseRef.orderBy(kCreatedAt).get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text("Something went wrong"));
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VideoPlayer(
                                              courseName: courseFinished,
                                              Url: snapshot.data!.docs[index]
                                                  ['id'])));
                                },
                                child: ItemWidget(
                                    title: snapshot.data!.docs[index]['title'],
                                    index: index),
                              );
                            });
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data! as Map<String, dynamic>;
                        return Text("task is : ${data['task']}");
                      }
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ));
                    }),
              )

              //
            ],
          ),
        );
      },
    );
  }
}
