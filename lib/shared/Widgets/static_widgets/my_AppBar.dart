import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/views/faq.dart';

import '../../../views/About.dart';
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
      actions: [
        TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));}, child: Text('About')),
        TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq()));}, child: Text('FAQ')),
        ModeSwitcher(),


      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(60);
}
