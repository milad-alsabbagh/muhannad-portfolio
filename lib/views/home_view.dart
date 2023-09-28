import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models/certificate_model.dart';
import 'package:muhannadwebsite/models/link_model.dart';
import 'package:muhannadwebsite/models_lists/skill_list.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_percentege_chart.dart';
import '../models/animated_photos_model.dart';
import '../models/navigator.dart';
import '../models/skill_model.dart';
import '../models_lists/animates_photos_list.dart';
import '../models_lists/certificates_list.dart';
import '../models_lists/links_list.dart';
import '../shared/Widgets/animated_widgets/animated_phots.dart';
import '../shared/Widgets/animated_widgets/onHoverText.dart';
import '../shared/components.dart';
import 'About.dart';
import 'faq.dart';

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    List<NavigatorTextButtons> navigators = [
      NavigatorTextButtons(
          context: context, screen: const About(), text: 'About'),
      NavigatorTextButtons(context: context, screen: const Faq(), text: 'FAQ'),
    ];
    WebsiteCubit cubit(context) => BlocProvider.of(context);
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: AutoSizeText(
                'Muhannad Al_Sabbagh',
                style: Theme.of(context).textTheme.titleLarge,
                minFontSize: 14,
              ),
              actions: [ModeSwithcer()],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Image(
                          image: AssetImage('assets/images/cover.jpeg'),
                          fit: BoxFit.fitWidth,
                          height: 250,
                          width: double.infinity,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  AssetImage('assets/images/profile.jpeg'),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  AnimatedDelayedTextChat(
                                      duration: Duration(seconds: 1),
                                      text: 'Hello World!'),
                                  AnimatedDelayedTextChat(
                                      duration: const Duration(seconds: 1),
                                      text: 'Welcome to my World'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color(0xFF6750A4).withOpacity(0.4),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                 vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                 Text(
                                  '< Courses />',
                                  style: GoogleFonts.sirinStencil(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300
                                  ),
                                 ),
                                 SizedBox(height: 15,),
                                OnHoverCertificateText(certificates: certificatesList),
                                SizedBox(height: 5,),
                                 Text(
                                  '< Skills />',
                                  style: GoogleFonts.sirinStencil(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                                SizedBox(height: 10,),
                                OnHoverSkillText(skills: skillsList),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              AnimatedPhotos(
                                animatedPhoto: animatedPhotosList,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: AnimatedNavigatorRow(
                              navigatorButtons: navigators,
                            )),
                      ],
                    ),
                    // Center(child: AnimatedPhotos(animatedPhoto: animatedPhotos,)),
                    Center(
                      child: AnimatedLinksContainer(),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
