import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/navigator.dart';
import '../models_lists/animates_photos_list.dart';
import '../models_lists/certificates_list.dart';
import '../models_lists/skill_list.dart';
import '../shared/Widgets/animated_widgets/animated_links_container.dart';
import '../shared/Widgets/animated_widgets/animated_navigator.dart';
import '../shared/Widgets/animated_widgets/animated_phots.dart';
import '../shared/Widgets/animated_widgets/onHoverCertificatesText.dart';
import '../shared/Widgets/animated_widgets/onHoverSkillText.dart';
import '../shared/Widgets/static_widgets/cover_stack.dart';
import '../shared/Widgets/static_widgets/mode_switcher.dart';
class DesktopView extends StatelessWidget {
  DesktopView({super.key,required this.navigators});

 List<NavigatorTextButtons> navigators;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: AutoSizeText(
         'Muhannad alsabbagh',
          style: GoogleFonts.arizonia(),
          minFontSize: 14,
        ),
        actions: [ModeSwitcher()],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CoverStack(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                              OnHoverCertificateText(
                                  certificates: certificatesList),
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
                              OnHoverSkillText(skills: skillsList),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: AnimatedPhotos(
                                animatedPhoto: animatedPhotosList,
                              ),
                            ),


                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      AnimatedNavigators(
                        navigatorButtons: navigators,
                      ),


                    ],
                  ),

                  // Center(child: AnimatedPhotos(animatedPhoto: animatedPhotos,)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: AnimatedLinksContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
