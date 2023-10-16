import 'package:flutter/material.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: currentWidth > 600
          ? const DesktopAppBar(
              isHome: false,
              currentPage: PageNames.faq,
            )
          : const MobileAppBar(
              isHome: false,
              currentPage: PageNames.faq,
            ),
      body: const Center(
        child: Text('this is faq screen'),
      ),
    );
  }
}
