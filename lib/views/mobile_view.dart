import 'package:flutter/material.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_drawer.dart';
import 'package:muhannadwebsite/shared/components.dart';

import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../models_lists/animates_photos_list.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const MyAppBar(
        isHome: true,
      ),
      drawer: const MyDrawer(),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: CarouselSlider(
                  slideIndicator: CircularSlideIndicator(
                    indicatorBorderColor: Colors.white,
                    padding: const EdgeInsets.only(top: 60),
                    currentIndicatorColor: const Color(0xFF6750A4),
                  ),
                  autoSliderDelay: const Duration(seconds: 1),
                  clipBehavior: Clip.antiAlias,
                  unlimitedMode: true,
                  slideTransform: const CubeTransform(),
                  children:
                      animatedPhotosList.map((e) => HoverImage(e: e)).toList()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: AnimatedLinksContainer(direction: Direction.vertical),
          )
        ],
      ),
    );
  }
}
