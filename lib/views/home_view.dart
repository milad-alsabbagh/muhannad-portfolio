import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models/certificate_model.dart';
import 'package:muhannadwebsite/models/link_model.dart';
import '../models/animated_photos_model.dart';
import '../models/navigator.dart';
import '../shared/Widgets/animated_widgets/animated_phots.dart';
import '../shared/Widgets/animated_widgets/links_Row.dart';
import '../shared/Widgets/animated_widgets/onHoverText.dart';
import '../shared/components.dart';
import 'About.dart';
import 'faq.dart';

class Home extends StatelessWidget {
  Home({super.key});
  List<AnimatedPhoto> photos = animatedPhotos;
  List<CertificateModel> cert=certificates;
  @override
  Widget build(BuildContext context) {
    List<NavigatorTextButtons> navigators = [
      NavigatorTextButtons(
          context: context, screen: const About(), text: 'About'),
      NavigatorTextButtons(context: context, screen: const Faq(), text: 'FAQ'),
    ];
    List<LinkModel>link =links;



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
                                      text: 'Hello World'),
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
                        OnHoverText(certificates: certificates),
                        Spacer(),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              AnimatedPhotos(
                                animatedPhoto: photos,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: AnimatedNavigatorRow(
                              navigatorButtons: navigators,
                            )),
                      ],
                    ),
                    // Center(child: AnimatedPhotos(animatedPhoto: animatedPhotos,)),
                    Center(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        transform: Matrix4.identity()
                          ..scale(cubit(context).rowContainer ? 1.2 : 1.0,
                              cubit(context).rowContainer ? 1.2 : 1.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blueAccent.withOpacity(0.2)),
                        padding:
                            EdgeInsets.only(left: 20, top: 10,bottom: 10,right: 10),
                        child: LinksRow(links: link),
                      ),
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
