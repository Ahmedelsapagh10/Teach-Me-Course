import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/controller/notes/cubit/NotesCubit.dart';
import 'package:tm_course/controller/notes/cubit/NotesState.dart';
import 'package:tm_course/controller/theme/cubit/themeState.dart';
import 'package:tm_course/view/widgets/expansionTile.dart';
import 'package:tm_course/view/widgets/sliver_app_bar.dart';

import '../../controller/theme/cubit/themeCubit.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<NotesCubit, NotesState>(
          builder: (context, snapshot) {
            var controller = BlocProvider.of<NotesCubit>(context);
            return SafeArea(
              child: Scaffold(
                body: CustomScrollView(
                  slivers: [
                    MySliverAppBar(image: 'assets/images/brainstorming.png'),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      SingleChildScrollView(
                        child: Column(children: [
                          finalExpansionTile(
                              controller: controller, categoryName: 'C++'),
                          finalExpansionTile(
                              controller: controller, categoryName: 'Dart'),
                          finalExpansionTile(
                              controller: controller, categoryName: 'OOP'),
                          finalExpansionTile(
                              controller: controller, categoryName: 'Flutter'),
                          SizedBox(
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                                ? 100
                                : 70,
                          ),
                        ]),
                      )
                    ]))
                  ],
                ),
                floatingActionButton: FloatingActionButton.extended(
                    onPressed: () {
                      // setState(() {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, StateSetter setState) {
                              return Form(
                                key: key,
                                child: Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      height:
                                          MediaQuery.of(context).size.width /
                                              1.5,
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20,
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Invalid Task..!';
                                                  }
                                                  return null;
                                                },
                                                controller:
                                                    controller.controller,
                                                decoration: InputDecoration(
                                                    label: const Text(
                                                        'Enter Your Note'),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8))),
                                              )),
                                          Expanded(
                                            child: DropdownButton(
                                                elevation: 0,
                                                value: controller.dropValue,
                                                items: controller.dropItem
                                                    .map(
                                                        (e) => DropdownMenuItem(
                                                              value: e,
                                                              child: Text(e),
                                                            ))
                                                    .toList(),
                                                onChanged: (String? v) {
                                                  setState(() {
                                                    controller.dropValue = v!;
                                                  });
                                                }),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                    child: TextButton(
                                                        onPressed: () {
                                                          if (key.currentState!
                                                              .validate()) {
                                                            setState(() {
                                                              controller
                                                                  .addNewNoteToDatabase(
                                                                context,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: const Text(
                                                          'add',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'Changa-VariableFont_wght',
                                                          ),
                                                        ))),
                                                Expanded(
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context);
                                                      },
                                                      child: const Text(
                                                        'cancle',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'Changa-VariableFont_wght',
                                                        ),
                                                      )),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          });
                      // });
                    },
                    label: const Text(
                      'Add Note',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Changa-VariableFont_wght',
                      ),
                    )),
              ),
            );
          },
        );
      },
    );
  }
}
