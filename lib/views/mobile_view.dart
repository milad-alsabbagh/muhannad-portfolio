import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/courses_skills_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_drawer.dart';
import 'package:muhannadwebsite/shared/components.dart';

import 'package:muhannadwebsite/shared/shared_variables.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../models_lists/animates_photos_list.dart';
import '../models_lists/certificates_list.dart';
import '../models_lists/skill_list.dart';
import '../shared/Widgets/animated_widgets/onHoverCertificatesText.dart';
import '../shared/Widgets/animated_widgets/onHoverSkillText.dart';

class MobileView extends StatelessWidget {
  // List<String> images;
  // CarouselPhotos({required this.images});
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  MyAppBar(),
      drawer: MyDrawer(),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Expanded(
            child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: CarouselSlider(
                slideIndicator: CircularSlideIndicator(
                  indicatorBorderColor: Colors.white,
                  padding: EdgeInsets.only(top: 60),
                  currentIndicatorColor:Color(0xFF6750A4),
                ),
                autoSliderDelay: const Duration(seconds: 1),
                clipBehavior: Clip.antiAlias,
                unlimitedMode: true,
                slideTransform:const  CubeTransform(),
                children: animatedPhotosList.map((e) => HoverImage(e: e)).toList()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: AnimatedLinksContainer(direction: Direction.column),
          )
        ],
      ),
    );
  }
}
