import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:muhannadwebsite/models_lists/blogs_list.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/constants.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';

import '../models_lists/links_list.dart';
import '../shared/Widgets/animated_widgets/animated_links_container.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    const double runSpacing = 30;
    const double spacing = 20;
    final columns = currentWidth > 950 ? 4 : 2;
    final w =
        ((MediaQuery.of(context).size.width - runSpacing * (columns - 1)) /
                columns) -
            20;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xff1C1B1F), Color(0xFF1C1B1F)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(currentWidth.toString()),
        ),
        //
        //
        //currentWidth > 600
        //     ? const DesktopAppBar(
        //         isHome: false,
        //         currentPage: PageNames.blog,
        //       )
        //     : const MobileAppBar(
        //         isHome: false,
        //         currentPage: PageNames.blog,
        //       ),
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const SizedBox(
                height: double.infinity,
                width: double.infinity,
              ),
              ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60.0, top: 10),
                    child: Wrap(
                      runSpacing: runSpacing,
                      spacing: spacing,
                      alignment: WrapAlignment.center,
                      children: List.generate(blogsList.length, (index) {
                        return Column(
                          children: [
                            Container(
                              width: w,
                              height: w / 3,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: const BoxDecoration(
                                  color: Color(0xff272B2A),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Image(
                                image: AssetImage(blogsList[index].imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: Colors.grey,
                              width: w,
                              height: 2,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: w,
                              color: const Color(0xff272B2A),
                              child: Text(
                                blogsList[index].title,
                                style: const TextStyle(
                                    color: Color(0xff29D6B6), fontSize: 20),
                              ),
                            ),
                            Container(
                              width: w,
                              height: w / 2,
                              color: const Color(0xff272B2A),
                              child: SingleChildScrollView(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 5,
                                    bottom: 5.0),
                                child: Text(
                                  blogsList[index].blogText,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              )),
                            ),
                            Container(
                              color: Colors.grey,
                              width: w,
                              height: 2,
                            ),
                            Container(
                                width: w,
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 15),
                                decoration: const BoxDecoration(
                                    color: Color(0xff272B2A),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Text(blogsList[index].date))
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
                  child:
                      AnimatedLinksContainer(direction: Direction.horizontal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
