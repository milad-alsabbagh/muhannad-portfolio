import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../models/navigator.dart';

class AnimatedNavigators extends StatefulWidget {
  final List<NavigatorTextButtons> navigatorButtons;

  // ignore: prefer_const_constructors_in_immutables
  AnimatedNavigators({
    super.key,
    required this.navigatorButtons,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedNavigatorsState createState() => _AnimatedNavigatorsState();
}

class _AnimatedNavigatorsState extends State<AnimatedNavigators> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    // Start the delay when the widget is initialized.
    Future.delayed(const Duration(seconds: 5), () {
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
      return Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.navigatorButtons
              .map((e) => WidgetAnimator(
                    incomingEffect:
                        WidgetTransitionEffects.incomingSlideInFromBottom(),
                    child: TextButton(
                      child: Text(
                        e.text,
                        // style: Theme.of(context).textTheme.labelMedium,
                      ),
                      onPressed: () {
                        e.onPressed();
                      },
                    ),
                  ))
              .toList(),
        ),
      ); // Display the second widget after the delay.
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose of any resources if needed.
  }
}
