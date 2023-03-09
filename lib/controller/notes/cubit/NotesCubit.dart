import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/controller/notes/cubit/NotesState.dart';

import '../../../constants.dart';
import '../../sign/shared_sign.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(InitState());
  final TextEditingController controller = TextEditingController();
  String dropValue = 'C++';
  List<String> dropItem = ['C++', 'Dart', 'OOP', 'Flutter'];

  ///create database istance
  CollectionReference docReference =
      FirebaseFirestore.instance.collection('AllNotes');
  Future<void> addNote() {
    return docReference
        .add({
          'note': controller.text,
          'categoty': dropValue,
          kCreatedAt: DateTime.now(),
          'id': user
        })
        .then((value) => debugPrint("Note Added"))
        .catchError((error) => debugPrint("Failed to add Note: $error"));
  }

  Future<void> addNewNoteToDatabase(BuildContext context) async {
    addNote();
    emit(LoadingState());
    Navigator.of(context).pop();
    controller.clear();
    dropValue = 'C++';
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('task is added'),
      backgroundColor: Colors.blueGrey,
      duration: Duration(
        milliseconds: 500,
      ),
    ));
    emit(AddNewNoteState());
  }

  deleteNote(String id) {
    docReference.doc(id).delete();
    emit(DeleteNewNoteState());
  }
}
