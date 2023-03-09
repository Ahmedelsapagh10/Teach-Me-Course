import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/controller/theme/cubit/themeCubit.dart';
import 'package:tm_course/controller/theme/cubit/themeState.dart';
import 'package:tm_course/view/pages/home.dart';

import 'package:tm_course/view/pages/profilescreen.dart';

import 'NotesScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _screens = [
    const Home(),
    // FBC(),
    const NotesScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          //   body: _Screens[_currentIndex],
          body: Stack(
              children: _screens
                  .asMap()
                  .map((i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: _currentIndex != i,
                        child: screen,
                      )))
                  .values
                  .toList()),

          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Notes',
                  icon: Icon(Icons.my_library_books_outlined),
                  activeIcon: Icon(Icons.my_library_books_rounded)),
              BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person))
            ],
          ),
        );
      },
    );
  }
}
