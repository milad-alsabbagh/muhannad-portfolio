import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models_lists/about.dart';
import 'package:muhannadwebsite/models_lists/courses_list.dart';
import 'package:muhannadwebsite/models_lists/features_list.dart';
import 'package:muhannadwebsite/models_lists/links_list.dart';
import 'package:muhannadwebsite/models_lists/skill_list.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/course_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/skill_container.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';

import '../models_lists/images_of_life_list.dart';
import '../shared/Widgets/animated_widgets/hover_image.dart';
import '../shared/Widgets/styles/text_styles.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    var skillController = ExpansionTileController();
    var courseController = ExpansionTileController();
    WebsiteCubit cubit(context) => BlocProvider.of(context);
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final currentWidth = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return Scaffold(
          appBar: currentWidth > 600
              ? const DesktopAppBar(
                  isHome: false,
                  currentPage: PageNames.about,
                )
              : const MobileAppBar(
                  isHome: false,
                  currentPage: PageNames.about,
                ),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(scrollbars: false),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        width: double.infinity,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            'Muhannad Al-sabbagh',
                            style: GoogleFonts.sirinStencil(
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'SOFTWARE ENGINEER ,ELECTRIC ENGINNER',
                            style:
                                TextStyle(fontSize: 20, color: Colors.blueGrey),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
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
                            height: 15,
                          ),
                          LinksRow(
                            links: linksList,
                            isHome: false,
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ExpansionTile(
                    controller: skillController,
                    onExpansionChanged: (value) {
                      courseController.collapse();
                      // skillController.expand();
                    },
                    title: const Center(
                        child: Text(
                      'Skills',
                      style: TextStyle(fontSize: 32),
                    )),
                    children: [
                      Center(
                        child: Container(
                            width: double.infinity,
                            // height: height / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black.withOpacity(0.3)),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Center(
                                  child: Wrap(
                                    children: List.generate(skillsList.length,
                                        (index) {
                                      return SkillContaienr(
                                          skillModel: skillsList[index]);
                                    }),
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      thickness: 3,
                      color: Colors.blueGrey,
                    ),
                  ),
                  ExpansionTile(
                    controller: courseController,
                    onExpansionChanged: (value) {
                      skillController.collapse();
                      // courseController.expand();
                    },
                    title: const Center(
                        child: Text(
                      'Courses',
                      style: TextStyle(fontSize: 32),
                    )),
                    children: [
                      Center(
                        child: Container(
                            width: double.infinity,
                            height: height / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black.withOpacity(0.3)),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Center(
                                  child: Wrap(
                                    children: List.generate(coursesList.length,
                                        (index) {
                                      return CourseContainer(
                                          courseModel: coursesList[index]);
                                    }),
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
