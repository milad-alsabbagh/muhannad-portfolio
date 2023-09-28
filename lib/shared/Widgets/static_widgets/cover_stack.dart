import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../animated_widgets/animated_text.dart';
class CoverStack extends StatelessWidget {
  const CoverStack({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        const Image(
          image: AssetImage('assets/images/cover.jpeg'),
          fit: BoxFit.fitWidth,
          height: 250,
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage:
                  AssetImage('assets/images/profile.jpeg'),
                ),
               const  SizedBox(
                  height: 15,
                ),
                Text(
                  'SoftWare Engineer',
                  style: GoogleFonts.sirinStencil(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      backgroundColor:
                      const Color(0xFF6750A4).withOpacity(0.4),
                      color: Colors.white),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedText(
                      duration: const Duration(seconds: 1),
                      text: 'Hello World!'),
                  AnimatedText(
                      duration: const Duration(seconds: 1),
                      text: 'Welcome to my World'),
                ],
              ),
            ),
           const SizedBox(width: 160,)
          ],
        ),
      ],
    );
  }
}
