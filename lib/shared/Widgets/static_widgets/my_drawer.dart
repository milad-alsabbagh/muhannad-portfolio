import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models_lists/certificates_list.dart';
import '../../../models_lists/skill_list.dart';
import '../animated_widgets/onHoverCertificatesText.dart';
import '../animated_widgets/onHoverSkillText.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:const Color(0xFF6750A4),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                ),

                Text(
                  'SoftWare Engineer',
                  style: GoogleFonts.sirinStencil(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      backgroundColor:
                      const Color.fromARGB(189, 82, 170, 221).withOpacity(0.4),
                      color: Colors.white),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(title:  Text(
              '< Certificates />',
              style: GoogleFonts.sirinStencil(
                  fontSize: 22,
                  fontWeight: FontWeight.w300),
            ),

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: OnHoverCertificateText(certificates: certificatesList),
                )
              ],),
            ExpansionTile(title: Text(
              '< Skills />',
              style: GoogleFonts.sirinStencil(
                  fontSize: 22,
                  fontWeight: FontWeight.w300),
            ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: OnHoverSkillText(skills: skillsList),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
