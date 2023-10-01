import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/views/mobile_view.dart';
import 'package:muhannadwebsite/views/desktop_view.dart';
import '../models/navigator.dart';
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
          return LayoutBuilder(builder: (context,constraints){
            if(constraints.minWidth>700){
              return DesktopView();
            }
            else{
              return MobileView();
            }
          }

          );
        },
        listener: (context, state) {});
  }
}
