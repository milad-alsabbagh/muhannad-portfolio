import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models/animated_photos_model.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../models/navigator.dart';

FutureBuilder<void> animatedDelayedText({
  required Duration duration,
  required String text,
}) {
  return FutureBuilder<void>(
    future: Future.delayed(duration, () {}),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return SizedBox(); // Display a loading indicator during the delay.
      } else {
        return TextAnimator(
          text,
          textAlign: TextAlign.center,
          maxLines: 2,
          characterDelay: Duration(milliseconds: 180),
          incomingEffect: WidgetTransitionEffects.incomingOffsetThenScale(),
          style: Theme.of(context).textTheme.titleLarge,
        ); // Display the second widget after the delay.
      }
    },
  );
}

FutureBuilder<void> animatedNavigatorRow({
  required List<NavigatorTextButtons> navigatorButtons
}) {
  return FutureBuilder<void>(
    future: Future.delayed(Duration(seconds: 5), () {}),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return SizedBox(); // Display a loading indicator during the delay.
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          navigatorButtons.map((e) =>
              WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(),
                child: TextButton(
                  child: Text(e.text,style: Theme.of(context).textTheme.labelMedium,),
                  onPressed:(){ e.onPressed();},
                ),
              )
          ).toList()
        ) ;// Display the second widget after the delay.
      }
    },
  );
}

class ModeSwithcer extends StatelessWidget {
  const ModeSwithcer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WebsiteCubit cubit(context)=>BlocProvider.of(context);
    return FlutterSwitch(
      value: cubit(context).isDark,
      onToggle: (bool value) {
        cubit(context).changeThemeMode();
        print(cubit(context).isDark);
      },
      width: 50,
      height: 25,
      padding: 1,
      activeColor: Colors.white,
      inactiveColor: Colors.black,
      activeToggleColor: Colors.white,
      inactiveToggleColor: Colors.black,
      activeIcon: const Icon(Icons.dark_mode,color: Colors.black,),
      inactiveIcon: const Icon(Icons.light_mode_sharp,color: Colors.amber,),
    );
  }
}

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

// WidgetAnimator(
// incomingEffect:
// WidgetTransitionEffects.incomingScaleDown(),
// outgoingEffect:
// WidgetTransitionEffects.outgoingScaleUp(),
// child: SizedBox(
// height: MediaQuery.of(context).size.height*0.4,
// child: const Image(
// image: AssetImage(
// 'assets/images/home.jpg',
// ),
// ),
// )),