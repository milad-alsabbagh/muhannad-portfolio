import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/views/blog_view.dart';
import 'package:muhannadwebsite/views/faq.dart';
import 'package:muhannadwebsite/views/images_of_life_view.dart';
import 'package:muhannadwebsite/views/desktop_viiew.dart';

import '../../../views/about_view.dart';
import '../../shared_variables.dart';
import '../styles/text_styles.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSize {
  const DesktopAppBar({super.key, required this.isHome, this.currentPage});
  final bool isHome;
  final PageNames? currentPage;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const DesktopView()));
        },
        child: AutoSizeText(
          'Muhannad Alsabbagh',
          style: GoogleFonts.arizonia(),
          minFontSize: 14,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutView()));
            },
            child: Text(
              'About',
              style:
                  currentPage == PageNames.about ? currentPageIndexStyle : null,
            )),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BlogView()));
            },
            child: Text(
              'Blogs',
              style:
                  currentPage == PageNames.blog ? currentPageIndexStyle : null,
            )),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Faq()));
          },
          child: Text(
            'FAQ',
            style: currentPage == PageNames.faq ? currentPageIndexStyle : null,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ImagesOfLife()));
          },
          child: Text(
            'Life\'s Image',
            style: currentPage == PageNames.imagesOfLife
                ? currentPageIndexStyle
                : null,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}

class MobileAppBar extends StatelessWidget implements PreferredSize {
  const MobileAppBar({super.key, required this.isHome, this.currentPage});
  final bool isHome;
  final PageNames? currentPage;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DesktopView()));
              },
              child: AutoSizeText(
                'Muhannad Alsabbagh',
                style: GoogleFonts.arizonia(),
                minFontSize: 14,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutView()));
                  },
                  child: Text(
                    'About',
                    style: currentPage == PageNames.about
                        ? currentPageIndexStyle
                        : null,
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BlogView()));
                  },
                  child: Text(
                    'Blogs',
                    style: currentPage == PageNames.blog
                        ? currentPageIndexStyle
                        : null,
                  )),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Faq()));
                },
                child: Text(
                  'FAQ',
                  style: currentPage == PageNames.faq
                      ? currentPageIndexStyle
                      : null,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImagesOfLife()));
                },
                child: Text(
                  'Life\'s Image',
                  style: currentPage == PageNames.imagesOfLife
                      ? currentPageIndexStyle
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
