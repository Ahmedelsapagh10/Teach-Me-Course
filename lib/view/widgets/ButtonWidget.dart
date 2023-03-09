import 'package:flutter/material.dart';

Widget CustomButtom(
    {required BuildContext context,
    required String title,
    required void Function()? onTap}) {
  final width = MediaQuery.of(context).size.width;

  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: width / 7.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey,
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    ),
  );
}
