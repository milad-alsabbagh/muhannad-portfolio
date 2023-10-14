import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:muhannadwebsite/models_lists/animated_text_list.dart';
import '../styles/text_styles.dart';

class AnimatedTextKitWidget extends StatelessWidget {
  const AnimatedTextKitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
        repeatForever: true,
        pause: const Duration(seconds: 3),
        animatedTexts: animatedTextList
            .map((e) => TyperAnimatedText(e, textStyle: animatedTextKitStyle))
            .toList());
  }
}
