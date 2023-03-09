import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  final Widget widget;

  customAppBar({
    required this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: MediaQuery.of(context).size.width / 1.1,
      floating: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: widget,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
