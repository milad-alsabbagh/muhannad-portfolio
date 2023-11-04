// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models_lists/hover_skills_list.dart';
import 'package:muhannadwebsite/models_lists/links_list.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/hover_skill_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';

import '../shared/Widgets/static_widgets/about_top.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});
  static String id = 'about';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final currentWidth = MediaQuery.of(context).size.width;
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
                        height: 12.0,
                      ),
                      Text(
                        '<Skills & Certificates />',
                        style: GoogleFonts.sirinStencil(fontSize: 32),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
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
                                        alignment: WrapAlignment.center,
                                        runSpacing: 30,
                                        spacing: 15,
                                        children: hoverSkillsList
                                            .map((e) => HoverSkillContainer(
                                                hoverSkill: e))
                                            .toList()),
                                  ),
                                ),
                              ))),
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
                        2),
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
