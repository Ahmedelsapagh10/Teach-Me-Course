import 'package:flutter/material.dart';

import '../../controller/theme/cubit/themeCubit.dart';

class CustomCourseWidget extends StatelessWidget {
  String image;
  int lessionThatfinished;
  String course;
  String totalTime;
  String lessonsNum;
  void Function()? onTap;
  CustomCourseWidget({
    required this.image,
    required this.lessionThatfinished,
    required this.course,
    required this.totalTime,
    required this.lessonsNum,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.width / 12
            : 8.0,
        vertical: MediaQuery.of(context).orientation == Orientation.landscape
            ? 8
            : 8.0,
      ),
      child: Container(
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.width / 4
            : MediaQuery.of(context).size.width / 2.4,
        decoration: BoxDecoration(
            color: ThemeCubit.isDart
                ? Colors.blueGrey.shade100
                : Colors.blueGrey.shade700,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  color: ThemeCubit.isDart ? Colors.grey : Colors.black54,
                  blurRadius: 2)
            ]),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  image,
                  fit: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? BoxFit.contain
                      : BoxFit.fitHeight,
                )),
            Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      course,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? 32
                              : 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoMono-SemiBold'),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'lessons | $lessonsNum',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                                ? 22
                                : 12,
                            color: ThemeCubit.isDart
                                ? Colors.blueGrey.shade700
                                : Colors.blueGrey.shade100,
                            fontFamily: 'RobotoMono-SemiBold',
                          ),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                        ),
                        TextButton(
                          onPressed: onTap,
                          child: Text(
                            'start now ',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                  ? 22
                                  : 16,
                              color: ThemeCubit.isDart
                                  ? Colors.teal
                                  : Colors.lightBlueAccent,
                              fontFamily: 'RobotoMono-SemiBold',
                            ),
                          ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(horizontal: 12),
                        //   child: LinearProgressIndicator(
                        //     value: lessionThatfinished / int.parse(lessonsNum),
                        //     color: Colors.blueGrey,
                        //     backgroundColor: Colors.blueGrey.shade50,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
