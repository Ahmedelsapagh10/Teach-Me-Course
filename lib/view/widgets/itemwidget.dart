import 'package:flutter/material.dart';

import '../../Model/dataModel.dart';
import '../../controller/theme/cubit/themeCubit.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  final String title;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4, right: 10, left: 10),
      child: Container(
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.width / 5
            : MediaQuery.of(context).size.width / 3,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: ThemeCubit.isDart
                ? Colors.blueGrey.shade100
                : Colors.blueGrey.shade800,
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
              flex: MediaQuery.of(context).orientation == Orientation.landscape
                  ? 2
                  : 1,
              child: SizedBox(
                height: MediaQuery.of(context).size.width / 7,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 24
                          : 16,
                      fontFamily: 'Changa-VariableFont_wght',
                    ),
                  ),
                ),
              ),
            ),
            Container(
                child: VerticalDivider(
              color: ThemeCubit.isDart
                  ? Colors.blueGrey.shade800
                  : Colors.blueGrey.shade200,
              endIndent: 30,
              indent: 30,
              thickness: 1.5,
            )),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 24
                        : 16,
                    fontFamily: 'Changa-VariableFont_wght',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
