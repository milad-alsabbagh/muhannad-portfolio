

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';


import '../models/animated_photos_model.dart';
import '../models/navigator.dart';
import '../shared/components.dart';
import '../shared/constants.dart';
import 'About.dart';
import 'faq.dart';

class Home extends StatelessWidget {
  Home({super.key});
  // Future<void> launchInBrowser(Uri url) async {
  //   if (!await launchUrl(
  //     url,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw Exception('Could not launch $url');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final Uri toLaunch =
    Uri.parse('https://google.com');
    List<NavigatorTextButtons> navigators = [
      NavigatorTextButtons(context: context, screen: const About(), text: 'About'),
      NavigatorTextButtons(context: context, screen: const Faq(), text: 'FAQ'),
    ];
    List<AnimatedPhoto> animatedPhotos=[
      AnimatedPhoto(imagePath: 'assets/images/sun.jpg'),
      AnimatedPhoto(imagePath: 'assets/images/dark.jpg'),
      AnimatedPhoto(imagePath: 'assets/images/home.jpg'),

    ];
    final Uri _url = Uri.parse('https://flutter.dev');
    WebsiteCubit cubit(context) => BlocProvider.of(context);
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: AutoSizeText('Muhannad Al_Sabbagh',
                 style:Theme.of(context).textTheme.titleLarge,
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
                    const SizedBox(
                      height: 40,
                    ),
                    Center(child: AnimatedPhotos(animatedPhoto: animatedPhotos,)),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(onPressed: (){
                          cubit(context).launchInBrowser(googleUrl);
                        }, child: Text('LinkedIn')),
                        TextButton(onPressed: (){
                          cubit(context).launchInBrowser(faceBookUrl);
                        }, child: Text('facebook')),
                      ],
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



