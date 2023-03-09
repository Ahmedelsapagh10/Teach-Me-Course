import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tm_course/controller/theme/cubit/themeCubit.dart';
import 'package:tm_course/controller/theme/cubit/themeState.dart';
import 'package:tm_course/view/pages/aboutScreen.dart';
import 'package:tm_course/view/pages/register/updateAccount.dart';
import 'package:tm_course/view/widgets/logowidget.dart';

import '../../controller/shared_preferences.dart';
import '../../controller/sign/shared_sign.dart';
import 'onbordingscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    getEmail();
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final controller = BlocProvider.of<ThemeCubit>(context);
        return Scaffold(
          appBar: AppBar(title: const Text('Profile')),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? MediaQuery.of(context).size.width / 1.2
                          : MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? MediaQuery.of(context).size.width / 1.4
                          : MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          color:
                              ThemeCubit.isDart ? Colors.white : Colors.black12,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(1, 1),
                                color: ThemeCubit.isDart
                                    ? Colors.grey.shade300
                                    : Colors.black12,
                                blurRadius: 2)
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          const Expanded(child: SizedBox()),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                  ? 200
                                  : 100,
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                  ? 200
                                  : 100,
                              child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                'assets/images/Untitled design.png',
                              )),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              username!,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).orientation ==
                                              Orientation.landscape
                                          ? 44
                                          : 22),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              user!,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).orientation ==
                                              Orientation.landscape
                                          ? 24
                                          : 12),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 1),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: ThemeCubit.isDart
                                                ? Colors.white
                                                : Colors.transparent,
                                            side: BorderSide(
                                                color: Colors.teal,
                                                width: MediaQuery.of(context).orientation ==
                                                        Orientation.landscape
                                                    ? 3
                                                    : 2),
                                            maximumSize: Size(
                                                MediaQuery.of(context).orientation ==
                                                        Orientation.landscape
                                                    ? 600
                                                    : 500,
                                                MediaQuery.of(context).orientation ==
                                                        Orientation.landscape
                                                    ? 60
                                                    : 50),
                                            minimumSize: Size(
                                                MediaQuery.of(context).orientation == Orientation.landscape ? 600 : 500,
                                                MediaQuery.of(context).orientation == Orientation.landscape ? 60 : 50)),
                                        onPressed: () async {
                                          await setLogOutScreen();
                                          // ignore: use_build_context_synchronously
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const OnBordingScreen()));
                                        },
                                        child: Text(
                                          'Log Out',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ThemeCubit.isDart
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        )),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: ThemeCubit.isDart
                                                ? Colors.teal
                                                : Colors.white,
                                            maximumSize: Size(
                                                MediaQuery.of(context)
                                                            .orientation ==
                                                        Orientation.landscape
                                                    ? 600
                                                    : 500,
                                                MediaQuery.of(context)
                                                            .orientation ==
                                                        Orientation.landscape
                                                    ? 60
                                                    : 50),
                                            minimumSize: Size(
                                                MediaQuery.of(context)
                                                            .orientation ==
                                                        Orientation.landscape
                                                    ? 600
                                                    : 500,
                                                MediaQuery.of(context)
                                                            .orientation ==
                                                        Orientation.landscape
                                                    ? 60
                                                    : 50)),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const UpdateAccount()));
                                        },
                                        child: Text(
                                          'Edit Name',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ThemeCubit.isDart
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ExpansionTile(
                      title: Text(
                        'setting',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                                ? 32
                                : 22),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'change Mode',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.landscape
                                            ? 24
                                            : 16),
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.changeMode();
                                  },
                                  icon: Icon(
                                    ThemeCubit.isDart
                                        ? Icons.dark_mode
                                        : Icons.sunny,
                                    size: 24,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'log out',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                                ? 32
                                : 22),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Exit',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.landscape
                                            ? 24
                                            : 16),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setLogOutScreen();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OnBordingScreen()),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.logout,
                                    size: 24,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'about',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                                ? 32
                                : 22),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'about',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.landscape
                                            ? 24
                                            : 16),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AboutScreen()));
                                  },
                                  icon: const Icon(
                                    Icons.info_outline,
                                    size: 24,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 50
                          : 32,
                    ),
                    MyLogoWidget(alignment: Alignment.bottomCenter),
                    SizedBox(
                      height: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 20
                          : 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
