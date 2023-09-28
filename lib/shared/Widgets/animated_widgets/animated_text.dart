import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
class AnimatedText extends StatefulWidget {
  final Duration duration;
  final String text;

  AnimatedText({
    required this.duration,
    required this.text,
  });

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    // Start the delay when the widget is initialized.
    Future.delayed(widget.duration, () {
      if (mounted) {
        setState(() {
          _showText = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_showText) {
      return SizedBox(); // Display a loading indicator during the delay.
    } else {
      return TextAnimator(
        widget.text,
        textAlign: TextAlign.center,
        maxLines: 2,
        characterDelay: Duration(milliseconds: 180),
        incomingEffect: WidgetTransitionEffects.incomingOffsetThenScale(),
        style: GoogleFonts.sirinStencil(
          fontSize: 32,
          color: Colors.white,
          backgroundColor: Color(0xFF6750A4).withOpacity(0.4),
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