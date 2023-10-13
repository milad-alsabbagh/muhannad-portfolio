import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_text_kit.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:lottie/lottie.dart';

class NewDesktopView extends StatelessWidget {
  const NewDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        isHome: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
                child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Lottie.asset('assets/lottie/animation1.json'),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: const Color(0xff272B2A).withOpacity(0.7),
                      child: Column(
                        children: [
                          Text(
                            'Hello World!',
                            style: GoogleFonts.sirinStencil(
                                color: Color(0xff29D6B6), fontSize: 26),
                          ),
                          Text(
                            'It\'s Memo',
                            style: GoogleFonts.sirinStencil(
                                color: Color(0xff29D6B6), fontSize: 26),
                          ),
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
