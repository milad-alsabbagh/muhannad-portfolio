import 'package:flutter/material.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import '../shared/Widgets/animated_widgets/animated_links_container.dart';
import '../shared/Widgets/animated_widgets/animated_phots.dart';
import '../shared/Widgets/static_widgets/courses_skills_container.dart';
import '../shared/Widgets/static_widgets/cover_stack.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        isHome: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CoverStack(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CoursesSkillsContainer(),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: AnimatedPhotos(),
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
                padding: const EdgeInsets.only(right: 30.0, bottom: 10),
                child: AnimatedLinksContainer(
                  direction: Direction.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
