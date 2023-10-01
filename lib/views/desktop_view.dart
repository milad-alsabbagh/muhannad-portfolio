import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';

import '../models/navigator.dart';
import '../models_lists/animates_photos_list.dart';
import '../models_lists/certificates_list.dart';
import '../models_lists/skill_list.dart';
import '../shared/Widgets/animated_widgets/animated_links_container.dart';
import '../shared/Widgets/animated_widgets/animated_navigator.dart';
import '../shared/Widgets/animated_widgets/animated_phots.dart';
import '../shared/Widgets/animated_widgets/onHoverCertificatesText.dart';
import '../shared/Widgets/animated_widgets/onHoverSkillText.dart';
import '../shared/Widgets/static_widgets/courses_skills_container.dart';
import '../shared/Widgets/static_widgets/cover_stack.dart';

class DesktopView extends StatelessWidget {
  DesktopView({super.key,required this.navigators});

 List<NavigatorTextButtons> navigators;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
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
                     CoursesSkillsContainer(),
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
                padding: const EdgeInsets.only(right: 30.0,bottom: 10),
                child: AnimatedLinksContainer(direction: Direction.row,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
