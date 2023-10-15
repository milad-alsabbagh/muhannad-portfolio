import 'package:flutter/material.dart';
import 'package:muhannadwebsite/models_lists/images_of_life_list.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/constants.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';

import '../shared/Widgets/animated_widgets/hover_image.dart';

class ImagesOfLife extends StatelessWidget {
  const ImagesOfLife({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    const double runSpacing = 10;
    const double spacing = 5;
    final columns = getWidth(context) > 950 ? 4 : 2;
    final w =
        ((MediaQuery.of(context).size.width - runSpacing * (columns - 1)) /
                columns) -
            20;
    return Scaffold(
      appBar: currentWidth > 600
          ? const DesktopAppBar(
              isHome: false,
              pageNames: PageNames.imagesOfLife,
            )
          : const MobileAppBar(
              isHome: false,
              pageNames: PageNames.imagesOfLife,
            ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Wrap(
              runSpacing: runSpacing,
              spacing: spacing,
              alignment: WrapAlignment.center,
              children: List.generate(imagesOfLifeList.length, (index) {
                return Column(
                  children: [
                    Container(
                        width: w,
                        height: w * 1.7,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                          color: Color(0xff272B2A),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: HoverImage(
                          animatedPhoto: imagesOfLifeList[index],
                          width: w,
                        )),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
