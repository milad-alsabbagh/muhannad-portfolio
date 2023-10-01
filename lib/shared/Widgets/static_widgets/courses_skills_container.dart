import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models_lists/certificates_list.dart';
import '../../../models_lists/skill_list.dart';
import '../animated_widgets/onHoverCertificatesText.dart';
import '../animated_widgets/onHoverSkillText.dart';
class CoursesSkillsContainer extends StatelessWidget {
  const CoursesSkillsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints:const  BoxConstraints(
        maxWidth: 300,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF6750A4).withOpacity(0.4),
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(width: 45,),
                Text(
                  '< Certificates />',
                  style: GoogleFonts.sirinStencil(
                      fontSize: 22,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            OnHoverCertificateText(),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(width: 45,),
                Text(
                  '< Skills />',
                  style: GoogleFonts.sirinStencil(
                      fontSize: 22,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            OnHoverSkillText(),
          ],
        ),
      ),
    );
  }
}
