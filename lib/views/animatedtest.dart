import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/shared/components.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../models/navigator.dart';

class AnimatedNavigatorRowChat extends StatefulWidget {
  final List<NavigatorTextButtons> navigatorButtons;

  AnimatedNavigatorRowChat({
    required this.navigatorButtons,
  });

  @override
  _AnimatedNavigatorRowChatState createState() => _AnimatedNavigatorRowChatState();
}

class _AnimatedNavigatorRowChatState extends State<AnimatedNavigatorRowChat> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    // Start the delay when the widget is initialized.
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _isLoaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return SizedBox(); // Display a loading indicator during the delay.
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.navigatorButtons
            .map((e) => WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(),
          child: TextButton(
            child: Text(
              e.text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onPressed: () {
              e.onPressed();
            },
          ),
        ))
            .toList(),
      ); // Display the second widget after the delay.
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose of any resources if needed.
  }
}

