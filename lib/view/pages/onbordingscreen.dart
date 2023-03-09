import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:tm_course/view/pages/register/signInScreen.dart';
import 'package:tm_course/view/widgets/onBordingWidget.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  bool isLastIndex = false;
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              isLastIndex = value == 2;
            });
          },
          children: [
            OnBordingModel(
                color: Colors.blueGrey.shade50,
                image: 'assets/images/blogging.png',
                title: 'TM Course',
                subtitle:
                    'Hello, and welcome to our community, which will help you learn programming and professionalize it well'),
            OnBordingModel(
                color: Colors.blueGrey.shade100,
                image: 'assets/images/web-development.png',
                title: 'TM Course',
                subtitle:
                    'The only way to learn a new programming language is by writing programs in it.'),
            OnBordingModel(
                color: Colors.grey.shade300,
                image: 'assets/images/brainstorming.png',
                title: 'TM Course',
                subtitle: ' “You can totally do this. Click to learn.”  '),
          ],
        ),
      ),
      bottomSheet: isLastIndex
          ? Container(
              color: Colors.teal,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
              height: 80,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          : Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'skip',
                        style: TextStyle(color: Colors.teal, fontSize: 20),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      onDotClicked: (index) {
                        controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      effect: WormEffect(
                        dotColor: Colors.grey.shade300,
                        activeDotColor: Colors.teal,
                        spacing: 16,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'next',
                        style: TextStyle(color: Colors.teal, fontSize: 20),
                      )),
                ],
              ),
            ),
    );
  }
}
