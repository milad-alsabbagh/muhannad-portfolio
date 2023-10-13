import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/views/blog_view.dart';
import 'package:muhannadwebsite/views/faq.dart';
import 'package:muhannadwebsite/views/new_home_view.dart';
import 'mode_switcher.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar({super.key, required this.isHome});
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: !isHome,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => NewDesktopView()));
        },
        child: AutoSizeText(
          'Muhannad alsabbagh',
          style: GoogleFonts.arizonia(),
          minFontSize: 14,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BlogView()));
            },
            child: Text('Blogs')),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Faq()));
            },
            child: Text('FAQ')),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
