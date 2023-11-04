import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_text_kit.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:lottie/lottie.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});
  static String id = 'desktopView';
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: currentWidth > 600
          ? const DesktopAppBar(
              isHome: true,
            )
          : const MobileAppBar(isHome: true),
      body: Column(
        children: [
          Expanded(
            child: Center(
                child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Lottie.asset('assets/lottie/animation3.json'),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: const Color(0xff272B2A).withOpacity(0.7),
                      child: Column(
                        children: [
                          Text(
                            'Hello World! It\'s Mimo',
                            style: GoogleFonts.sirinStencil(
                                color: const Color(0xff29D6B6), fontSize: 32),
                          ),
                          // Text(
                          //   'It\'s Mimo',
                          //   style: GoogleFonts.sirinStencil(
                          //       color: const Color(0xff29D6B6), fontSize: 26),
                          // ),
                        ],
                      ),
                    ),
                    const AnimatedTextKitWidget(),
                  ],
                )
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: AnimatedLinksContainer(direction: Direction.horizontal),
          ),
        ],
      ),
    );
  }
}
