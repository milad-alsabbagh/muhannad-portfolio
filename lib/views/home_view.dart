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
import 'package:muhannadwebsite/views/desktop_view.dart';
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
          return LayoutBuilder(builder: (context,constraints){
            if(constraints.minWidth>700){
              return DesktopView(navigators: navigators,);
            }
            else{
              return Scaffold(
              backgroundColor: Colors.purple,
              );
            }
          }

          );
        },
        listener: (context, state) {});
  }
}
