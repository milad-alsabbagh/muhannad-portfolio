// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models_lists/about.dart';
import 'package:muhannadwebsite/models_lists/certificates_list.dart';
import 'package:muhannadwebsite/models_lists/features_list.dart';
import 'package:muhannadwebsite/models_lists/key_skills.dart';
import 'package:muhannadwebsite/models_lists/links_list.dart';
import 'package:muhannadwebsite/models_lists/skills_list.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/certificate_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/skill_container.dart';
import 'package:muhannadwebsite/shared/constants.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';

import '../models_lists/images_of_life_list.dart';
import '../shared/Widgets/animated_widgets/hover_image.dart';
import '../shared/Widgets/static_widgets/about_top.dart';
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
          body: Stack(
            children: [
              const SizedBox(
                height: double.infinity,
              ),
              ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(scrollbars: false),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AboutTop(),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        'Skills',
                        style: GoogleFonts.sirinStencil(fontSize: 32),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: double.infinity,
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
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Certificates',
                        style: GoogleFonts.sirinStencil(fontSize: 32),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20.0,
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: Center(
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black.withOpacity(0.3)),
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Center(
                                      child: Wrap(
                                        children: List.generate(
                                            certificatesList.length, (index) {
                                          return CertificateContainer(
                                              certificateModel:
                                                  certificatesList[index]);
                                        }),
                                      ),
                                    ),
                                  ),
                                )),
                          )),
                    ]),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: currentWidth / 2 -
                    ((40 +
                            ((linksList.length - 1) * 10) +
                            (linksList.length * 34)) /
                        2) -
                    24,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child:
                      AnimatedLinksContainer(direction: Direction.horizontal),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
