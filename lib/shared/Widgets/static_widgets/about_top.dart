import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models_lists/about.dart';
import '../../../models_lists/key_skills.dart';
import '../../constants.dart';
import '../styles/text_styles.dart';

class AboutTop extends StatelessWidget {
  const AboutTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black.withOpacity(0.3),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Muhannad Alsabbagh',
            style: GoogleFonts.sirinStencil(
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'SOFTWARE ENGINEER ,ELECTRIC ENGINNER',
            style: TextStyle(fontSize: 20, color: Colors.blueGrey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: AnimatedTextKit(
                repeatForever: false,
                pause: const Duration(seconds: 3),
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(aboutMe,
                      speed: const Duration(milliseconds: 50),
                      textStyle: animatedTextKitAboutMeStyle)
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
              children: keySkills
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 10.0, bottom: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: niceGreen),
                            borderRadius: BorderRadius.circular(40)),
                        child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              ColorizeAnimatedText(
                                e,
                                textStyle: colorizeTextStyle,
                                colors: colorizeColors,
                              ),
                            ]),
                      ),
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
}
