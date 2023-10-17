import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models_lists/about.dart';
import 'package:muhannadwebsite/models_lists/features_list.dart';
import 'package:muhannadwebsite/models_lists/links_list.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';

import '../models_lists/images_of_life_list.dart';
import '../shared/Widgets/animated_widgets/hover_image.dart';
import '../shared/Widgets/styles/text_styles.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          'Muhannad Al-sabbagh',
                          style: GoogleFonts.sirinStencil(
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'SOFTWARE ENGINEER ,ELECTRIC ENGINNER',
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: AnimatedTextKit(
                              repeatForever: false,
                              pause: const Duration(seconds: 3),
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(aboutMe,
                                    speed: Duration(milliseconds: 50),
                                    textStyle: animatedTextKitAboutMeStyle)
                              ]),
                        ),
                        SizedBox(
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
                const Text('Skills', style: TextStyle(fontSize: 32)),
                Container(
                    width: double.infinity,
                    height: height / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black.withOpacity(0.3)),
                    child: Wrap())
              ]),
            ),
          ),
        );
      },
    );
  }
}
