import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tm_course/view/widgets/logowidget.dart';

import '../../controller/theme/cubit/themeCubit.dart';

class MySliverAppBar extends StatelessWidget {
  String image;
  MySliverAppBar({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ThemeCubit.isDart
          ? Colors.blueGrey.shade50
          : Colors.blueGrey.shade700,
      expandedHeight:
          MediaQuery.of(context).orientation == Orientation.landscape
              ? MediaQuery.of(context).size.width / 2.2
              : MediaQuery.of(context).size.width / 1.1,
      pinned: true,
      stretch: true,
      floating: true,
      snap: false,
      elevation: 0,
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.only(
                  bottom: 30.0, left: 10, right: 10, top: 10),
              child: ClipRRect(
                child: Image.asset(
                  image,
                  fit: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? BoxFit.contain
                      : BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: MyLogoWidget(alignment: Alignment.bottomCenter),
          ),
        ],
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
