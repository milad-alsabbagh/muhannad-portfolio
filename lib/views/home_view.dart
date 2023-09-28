import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models_lists/skill_list.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_navigator.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/onHoverSkillText.dart';
import '../models/navigator.dart';
import '../models_lists/animates_photos_list.dart';
import '../models_lists/certificates_list.dart';
import '../shared/Widgets/animated_widgets/animated_phots.dart';
import '../shared/Widgets/animated_widgets/onHoverCertificatesText.dart';
import '../shared/Widgets/static_widgets/cover_stack.dart';
import '../shared/Widgets/static_widgets/mode_switcher.dart';
import 'About.dart';
import 'faq.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    List<NavigatorTextButtons> navigators = [
      NavigatorTextButtons(
          context: context, screen: const About(), text: 'About'),
      NavigatorTextButtons(context: context, screen: const Faq(), text: 'FAQ'),
    ];
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: AutoSizeText(
                'Muhannad Al_Sabbagh',
                style: GoogleFonts.sirinStencil(),
                minFontSize: 14,
              ),
              actions:  [ModeSwitcher()],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  const CoverStack(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:const  EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color:const  Color(0xFF6750A4).withOpacity(0.4),
                            borderRadius:const  BorderRadius.only(
                                bottomRight: Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '< Courses />',
                                  style: GoogleFonts.sirinStencil(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                OnHoverCertificateText(
                                    certificates: certificatesList),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '< Skills />',
                                  style: GoogleFonts.sirinStencil(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300),
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
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: AnimatedPhotos(
                                  animatedPhoto: animatedPhotosList,
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: AnimatedLinksContainer(),
                              )
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
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
