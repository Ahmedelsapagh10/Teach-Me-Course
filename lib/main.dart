import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/controller/notes/cubit/NotesCubit.dart';
import 'package:tm_course/controller/sign/signUpCubit.dart';
import 'package:tm_course/controller/theme/cubit/themeCubit.dart';
import 'package:tm_course/controller/theme/cubit/themeState.dart';
import 'package:tm_course/controller/shared_preferences.dart';
import 'package:tm_course/controller/theme/theme.dart';
import 'package:tm_course/view/pages/homescreen.dart';
import 'package:tm_course/view/pages/onbordingscreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controller/sign/shared_sign.dart';
import 'controller/sign/signInCubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await getEmail();
  await getUserName();
  final showHome = await getStartedScreen();
  ThemeCubit.isDart = await ThemeCubit.getMode();
  runApp(MyApp(
    showHome: showHome,
  ));

  ///firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({required this.showHome, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => SignInCubit()),

        // BlocProvider(create: (context) => CourseCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Teach Me Course',
            debugShowCheckedModeBanner: false,
            theme:
                ThemeCubit.isDart ? MyTheme.lightTheme() : MyTheme.dartTheme(),
            home: showHome ? const HomeScreen() : const OnBordingScreen(),
          );
        },
      ),
    );
  }
}
