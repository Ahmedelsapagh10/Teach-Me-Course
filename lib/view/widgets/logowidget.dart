import 'package:flutter/material.dart';

import '../../controller/theme/cubit/themeCubit.dart';

class MyLogoWidget extends StatelessWidget {
  AlignmentGeometry? alignment;
  MyLogoWidget({
    required this.alignment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: 'TM',
          style: TextStyle(
            decoration: TextDecoration.overline,
            decorationColor:
                ThemeCubit.isDart ? Colors.teal : Colors.tealAccent,
            decorationThickness: 5,
            decorationStyle: TextDecorationStyle.solid,
            fontFamily: 'Ubuntu-Medium',
            fontSize: 18,
            color: ThemeCubit.isDart ? Colors.black : Colors.white,
          ),
        ),
        TextSpan(
          text: ' C',
          style: TextStyle(
              letterSpacing: 2,
              color: ThemeCubit.isDart ? Colors.teal : Colors.tealAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'ZahraRoosta Regular'),
        ),
        TextSpan(
          text: 'ourse',
          style: TextStyle(
              // backgroundColor: Colors.red,
              letterSpacing: 2,
              color: ThemeCubit.isDart ? Colors.black : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'ZahraRoosta Regular'),
        ),
      ])),
    );
  }
}
