
import 'package:flutter/material.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';

import '../models/navigator.dart';
import '../shared/Widgets/animated_widgets/animated_links_container.dart';
import '../shared/Widgets/animated_widgets/animated_phots.dart';
import '../shared/Widgets/static_widgets/courses_skills_container.dart';
import '../shared/Widgets/static_widgets/cover_stack.dart';

class DesktopView extends StatelessWidget {
  DesktopView({super.key});


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
                              ),
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),

                  // Center(child: AnimatedPhotos(animatedPhoto: animatedPhotos,)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0,bottom: 10),
                child: AnimatedLinksContainer(direction: Direction.horizontal,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
