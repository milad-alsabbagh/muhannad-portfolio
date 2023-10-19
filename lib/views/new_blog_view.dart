// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/models/blog_model.dart';
import 'package:muhannadwebsite/models_lists/blogs_list.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/blog_container.dart';

import '../models_lists/links_list.dart';
import '../shared/Widgets/animated_widgets/animated_links_container.dart';
import '../shared/Widgets/static_widgets/my_AppBar.dart';
import '../shared/shared_variables.dart';

class NewBlogsView extends StatelessWidget {
  const NewBlogsView({super.key});
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: currentWidth > 600
          ? const DesktopAppBar(
              isHome: false,
              currentPage: PageNames.blog,
            )
          : const MobileAppBar(
              isHome: false,
              currentPage: PageNames.blog,
            ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(scrollbars: false),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'MY Blogs',
                      style: GoogleFonts.sirinStencil(fontSize: 32),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20.0, left: 8.0, right: 8.0),
                        child: Center(
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black.withOpacity(0.3)),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Center(
                                    child: Wrap(
                                      children: List.generate(blogsList.length,
                                          (index) {
                                        return BlogContainer(
                                            blogModel: blogsList[index]);
                                      }),
                                    ),
                                  ),
                                ),
                              )),
                        ))
                  ],
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
                    2) -
                24,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AnimatedLinksContainer(direction: Direction.horizontal),
            ),
          ),
        ],
      ),
    );
  }
}
