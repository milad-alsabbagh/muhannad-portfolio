import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/shared/constants.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../models/animated_photos_model.dart';
import '../models/navigator.dart';
import '../shared/components.dart';
import 'About.dart';
import 'faq.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<NavigatorTextButtons> navigators = [
      NavigatorTextButtons(context: context, screen: const About(), text: 'About'),
      NavigatorTextButtons(context: context, screen: const Faq(), text: 'FAQ'),
    ];
    List<AnimatedPhoto> animatedPhotos=[
      AnimatedPhoto(imagePath: 'assets/images/sun.jpg'),
      AnimatedPhoto(imagePath: 'assets/images/dark.jpg'),
      AnimatedPhoto(imagePath: 'assets/images/home.jpg'),

    ];
    WebsiteCubit cubit(context) => BlocProvider.of(context);
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: AutoSizeText('Muhannad Al_Sabbagh',
                  style: Theme.of(context).textTheme.titleLarge,
                minFontSize: 14,
              ),
              actions: [
                 ModeSwithcer(),
              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image(image:cubit(context).isDark? AssetImage('assets/images/background.jpg'):AssetImage('assets/images/lightbackground.jpg'),fit: BoxFit.fill,height: 300,width: double.infinity,),
                        Column(
                          children: [
                            animatedDelayedText(
                                duration: const Duration(seconds: 1), text: 'Hello World!'),
                            animatedDelayedText(
                                duration: const Duration(seconds: 1),
                                text: 'Welcome to my World'),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: animatedNavigatorRow(navigatorButtons: navigators),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(child: AnimatedPhotos(animatedPhoto: animatedPhotos,))
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}



