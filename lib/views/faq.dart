import 'package:flutter/material.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        isHome: false,
        pageNames: PageNames.faq,
      ),
      body: Center(
        child: Text('this is faq screen'),
      ),
    );
  }
}
