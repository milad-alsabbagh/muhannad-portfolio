import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AnimatedTextKitWidget extends StatelessWidget {
  const AnimatedTextKitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
        repeatForever: true,
        pause: const Duration(seconds: 3),
        animatedTexts: [
          TypewriterAnimatedText('programmer', textStyle: animatedTextKitStyle),
          TypewriterAnimatedText(
            'Developer',
            textStyle: animatedTextKitStyle,
          ),
          TypewriterAnimatedText('Problem Solver',
              textStyle: animatedTextKitStyle),
        ]);
  }
}
