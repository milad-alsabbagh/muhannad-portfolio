import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../models/animated_photos_model.dart';


class AnimatedPhotos extends StatelessWidget {
  List<AnimatedPhoto> animatedPhoto;
  AnimatedPhotos({required this.animatedPhoto});

  @override
  Widget build(BuildContext context) {
    return WidgetAnimatorSequence(
        tapToProceed: true,
        loop: true,
        transitionTime: const Duration(seconds: 5),
        children: animatedPhoto.map((e) => WidgetAnimator(
            incomingEffect:
            WidgetTransitionEffects.incomingScaleDown(),
            outgoingEffect:
            WidgetTransitionEffects.outgoingScaleUp(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.4,
              child:  Image(
                image: AssetImage(e.imagePath),

              ),
            )),).toList()
    );
  }
}