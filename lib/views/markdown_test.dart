import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui_web';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  // Create an HtmlElementView widget for the iframe element.

  @override
  Widget build(BuildContext context) {
    platformViewRegistry.registerViewFactory(
        'hello-html',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src =
              'https://drive.google.com/file/d/1RBUyJub0zfTv1FyTf8rQPHLgKi7PV-qb/view?usp=sharing'
          ..style.border = 'none');
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: HtmlElementView(
          viewType: 'hello-html',
        ),
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: PlatformWebViewWidget(
    //     PlatformWebViewWidgetCreationParams(controller: _controller),
    //   ).build(context),
    // ),
  }
}
