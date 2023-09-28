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
              height: 300,
              child: AspectRatio(
                aspectRatio: 12/16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(e.imagePath),
                     fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            )),).toList()
    );
  }
}