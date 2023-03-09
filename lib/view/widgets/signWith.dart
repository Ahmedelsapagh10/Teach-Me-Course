import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/controller/theme/cubit/themeCubit.dart';
import 'package:tm_course/controller/theme/cubit/themeState.dart';

Widget SignWidget(
    {required double topleft,
    required double topright,
    required double bottomleft,
    required double bottomright,
    required BuildContext context,
    required String title,
    required void Function()? onTap,
    required String image}) {
  final width = MediaQuery.of(context).size.width;

  return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width / 2.2,
          height: width / 8.5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                color: Colors.grey.shade500,
                blurRadius: 2,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topleft),
                topRight: Radius.circular(topright),
                bottomRight: Radius.circular(bottomright),
                bottomLeft: Radius.circular(bottomleft)),
            color: ThemeCubit.isDart ? Colors.white : Colors.blueGrey.shade300,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
                width: 30,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    color: ThemeCubit.isDart ? Colors.black : Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  });
}
