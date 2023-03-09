import 'package:flutter/material.dart';

import '../../controller/notes/cubit/NotesCubit.dart';
import '../../controller/theme/cubit/themeCubit.dart';
import 'customFutureBuilder.dart';

class finalExpansionTile extends StatelessWidget {
  finalExpansionTile({
    Key? key,
    required this.controller,
    required this.categoryName,
  }) : super(key: key);
  String categoryName;

  final NotesCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: ThemeCubit.isDart
                ? Colors.blueGrey.shade100
                : Colors.blueGrey.shade600,
            borderRadius: BorderRadius.circular(12)),
        child: ExpansionTile(
            title: Text(
              categoryName,
              style: TextStyle(
                fontSize:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 22
                        : 18,
              ),
            ),
            children: [
              CustomFutureBuilderWidget(
                  controller: controller, categoryName: categoryName)
            ]),
      ),
    );
  }
}
