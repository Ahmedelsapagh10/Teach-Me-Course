import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tm_course/controller/theme/cubit/themeCubit.dart';
import 'package:tm_course/controller/theme/cubit/themeState.dart';
import 'package:tm_course/view/widgets/logowidget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: MyLogoWidget(alignment: Alignment.center),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  '''

      من خلال تطبيقنا ان شاء الله سيتم تقديم محتوي خاص بكل مايتعلق بالكمبيوتر والبرمجه
     ( C++ ) وسيتم تقديم كورسات برمجه للمبتدئين ايضاً 
      وايضاً كورسات  ف تطوير برامج الموبايل والويب 
      using Dart Language And Flutter Framework
      بإذن الله تعالي

      ''',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Changa-VariableFont_wght',
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 28
                          : 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
              'تابعنا علي ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Changa-VariableFont_wght',
                  fontSize: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 32
                      : 18),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () {
                          _launchUrl(
                              url: 'https://www.facebook.com/ahmedMelsapagh');
                        },
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          size: 32,
                          color: Colors.blue.shade500,
                        )),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          _launchUrl(
                              url:
                                  'https://www.youtube.com/channel/UCgEj5nlK8_5MrADHCzqOMUA?sub_confirmation=1');
                        },
                        alignment: Alignment.center,
                        icon: const Icon(
                          FontAwesomeIcons.youtube,
                          size: 32,
                          color: Colors.red,
                        )),
                  ),
                  Expanded(
                    child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () {
                          _launchUrl(
                              url:
                                  'https://www.linkedin.com/in/ahmed-elsapagh-aa8010220/');
                        },
                        icon: Icon(
                          FontAwesomeIcons.linkedin,
                          size: 32,
                          color: Colors.blue.shade800,
                        )),
                  ),
                ],
              ),
            ),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 100.0
                      : 50),
                  child: ThemeCubit.isDart
                      ? Image.asset(
                          'assets/images/l1.png',
                          width: 150,
                        )
                      : Image.asset(
                          'assets/images/l1w.png',
                          width: 150,
                        ),
                );
              },
            )

            // MyLogoWidget(alignment: Alignment.center),
          ],
        )),
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
