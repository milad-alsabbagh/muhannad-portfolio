import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/views/blog_view.dart';
import 'package:muhannadwebsite/views/faq.dart';
import 'package:muhannadwebsite/views/images_of_life_view.dart';
import 'package:muhannadwebsite/views/new_home_view.dart';

import '../../shared_variables.dart';
import '../styles/text_styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar({super.key, required this.isHome, this.pageNames});
  final bool isHome;
  final PageNames? pageNames;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const NewDesktopView()));
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
                  MaterialPageRoute(builder: (context) => const BlogView()));
            },
            child: Text(
              'Blogs',
              style: pageNames == PageNames.blog ? currentPageIndexStyle : null,
            )),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Faq()));
          },
          child: Text(
            'FAQ',
            style: pageNames == PageNames.faq ? currentPageIndexStyle : null,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ImagesOfLife()));
          },
          child: Text(
            'Life\'s Image',
            style: pageNames == PageNames.imagesOfLife
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
