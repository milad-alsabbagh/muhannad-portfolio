import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mode_switcher.dart';
class MyAppBar extends StatelessWidget implements PreferredSize {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: AutoSizeText(
        'Muhannad alsabbagh',
        style: GoogleFonts.arizonia(),
        minFontSize: 14,
      ),
      actions: [ModeSwitcher()],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(60);
}
