// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/controller/theme/cubit/themeCubit.dart';
import 'package:tm_course/controller/theme/cubit/themeState.dart';

import '../widgets/sliver_app_bar.dart';
import '../widgets/sliver_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            // ignore: prefer_const_literals_to_create_immutables
            slivers: [
              MySliverAppBar(image: 'assets/images/web-development.png'),
              MySliverList(),
            ],
          ),
        );
      },
    );
  }
}
