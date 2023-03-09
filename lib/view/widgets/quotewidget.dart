import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../controller/theme/cubit/themeCubit.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 32
                    : 18,
            backgroundColor: Colors.transparent.withOpacity(0.1),
            fontFamily: 'RobotoMono-SemiBold',
            fontWeight: FontWeight.bold,
            color: ThemeCubit.isDart ? Colors.black : Colors.white,
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            isRepeatingAnimation: true,
            pause: const Duration(seconds: 5),
            animatedTexts: [
              TyperAnimatedText(
                'With enough practice, any interface is intuitive.',
              ),
              TyperAnimatedText(
                '"The success formula: solve your own problems and freely share the solutions."',
              ),
              TyperAnimatedText(
                'Think twice, Write code once',
              ),
              FadeAnimatedText(
                '"Education is no substitute for intelligence."',
              ),
              TypewriterAnimatedText(
                '"The ability to stay calm during conflict is a superpower."',
              ),
              RotateAnimatedText(
                '"Ultimately, if you are curious about something, you will be successful at it."',
              )
            ],
          ),
        ),
      ),
    );
  }
}
