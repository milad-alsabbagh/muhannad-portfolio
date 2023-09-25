import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:TextAnimator(
          'Hello World!'
              'welcome to my world',
          maxLines: 2,
          characterDelay: Duration(milliseconds: 300),
          incomingEffect: WidgetTransitionEffects.incomingOffsetThenScale(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
