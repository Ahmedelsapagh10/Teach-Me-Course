import 'package:flutter/material.dart';

import '../../controller/theme/cubit/themeCubit.dart';

class NoteWidget extends StatefulWidget {
  String note;
  void Function() onPressed;
  NoteWidget({required this.note, required this.onPressed, super.key});

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ThemeCubit.isDart ? Colors.white70 : Colors.black38,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.note,
                style: TextStyle(
                  fontFamily: 'RobotoMono-SemiBold',
                  fontSize: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 20
                      : 18,
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(
                Icons.delete,
              ))
        ],
      ),
    );
  }
}
