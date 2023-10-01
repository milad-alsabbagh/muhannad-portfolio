import 'package:flutter/material.dart';
import 'package:muhannadwebsite/models_lists/animates_photos_list.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../models/animated_photos_model.dart';


class AnimatedPhotos extends StatelessWidget {

  const AnimatedPhotos();

  @override
  Widget build(BuildContext context) {
    return WidgetAnimatorSequence(
        tapToProceed: true,
        loop: true,
        transitionTime: const Duration(seconds: 5),
        children: animatedPhotosList.map((e) => WidgetAnimator(
            incomingEffect:
            WidgetTransitionEffects.incomingScaleDown(),
            outgoingEffect:
            WidgetTransitionEffects.outgoingScaleUp(),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 400
              ),
              child: AspectRatio(
                aspectRatio: 10/16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(e.imagePath),
                  ),
                ),
              ),
            )),).toList()
    );
  }
}