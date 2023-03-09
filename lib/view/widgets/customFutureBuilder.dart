import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../controller/notes/cubit/NotesCubit.dart';
import '../../controller/sign/shared_sign.dart';
import 'noteWidget.dart';

class CustomFutureBuilderWidget extends StatelessWidget {
  const CustomFutureBuilderWidget(
      {Key? key, required this.controller, required this.categoryName})
      : super(key: key);

  final NotesCubit controller;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: controller.docReference.get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  if (snapshot.data!.docs[index]['categoty'] ==
                          categoryName &&
                      snapshot.data!.docs[index]['id'] == user) {
                    return NoteWidget(
                        onPressed: () {
                          controller
                              .deleteNote(snapshot.data!.docs[index].id);
                        },
                        note: snapshot.data!.docs[index]['note']);
                  }
                  return Container();
                });
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
            return Text("task is : ${data['task']}");
          }

          return const Center(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          ));
        });
  }
}
