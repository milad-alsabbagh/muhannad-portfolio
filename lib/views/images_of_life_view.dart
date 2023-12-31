import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models_lists/images_of_life_list.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';

import 'package:muhannadwebsite/shared/shared_variables.dart';

import '../models_lists/links_list.dart';
import '../shared/Widgets/animated_widgets/animated_links_container.dart';
import '../shared/Widgets/animated_widgets/hover_image.dart';

class ImagesOfLife extends StatelessWidget {
  const ImagesOfLife({super.key});
  static String id = 'imagesOfLifeView';
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    const double runSpacing = 10;
    const double spacing = 5;
    final columns = currentWidth > 950 ? 4 : 2;
    final w =
        ((MediaQuery.of(context).size.width - runSpacing * (columns - 1)) /
                columns) -
            20;
    WebsiteCubit cubit(context) => BlocProvider.of(context);
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: currentWidth > 600
              ? const DesktopAppBar(
                  isHome: false,
                  currentPage: PageNames.imagesOfLife,
                )
              : const MobileAppBar(
                  isHome: false,
                  currentPage: PageNames.imagesOfLife,
                ),
          body: InkWell(
            onTap: () {
              cubit(context).clickOnImage(-1);
            },
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 60.0, top: 10),
                        child: Wrap(
                          runSpacing: runSpacing,
                          spacing: spacing,
                          alignment: WrapAlignment.center,
                          children:
                              List.generate(imagesOfLifeList.length, (index) {
                            return Column(
                              children: [
                                Container(
                                    width: w,
                                    height: w * 1.7,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff272B2A),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        cubit(context).clickOnImage(
                                            imagesOfLifeList[index].index);
                                      },
                                      child: HoverImage(
                                        animatedPhoto: imagesOfLifeList[index],
                                        width: w,
                                      ),
                                    )),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: currentWidth / 2 -
                        ((40 +
                                ((linksList.length - 1) * 10) +
                                (linksList.length * 34)) /
                            2),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AnimatedLinksContainer(
                          direction: Direction.horizontal),
                    ),
                  ),
                  cubit(context).clickedImageIndex != -1
                      ? Visibility(
                          visible: cubit(context).clickedImageIndex != -1
                              ? true
                              : false,
                          child: Stack(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                // constraints: const BoxConstraints(
                                //     maxHeight: 500, maxWidth: 1000),
                                child: Image(
                                  image: AssetImage(imagesOfLifeList[
                                          cubit(context).clickedImageIndex]
                                      .imagePath),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    cubit(context).clickOnImage(-1);
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  )),
                            ],
                          ))
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
