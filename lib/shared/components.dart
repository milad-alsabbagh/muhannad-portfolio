import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models/animated_photos_model.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../models/navigator.dart';
class AnimatedDelayedTextChat extends StatefulWidget {
  final Duration duration;
  final String text;

  AnimatedDelayedTextChat({
    required this.duration,
    required this.text,
  });

  @override
  _AnimatedDelayedTextChatState createState() => _AnimatedDelayedTextChatState();
}

class _AnimatedDelayedTextChatState extends State<AnimatedDelayedTextChat> {
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
          color: Colors.blue,
          backgroundColor: Colors.black.withOpacity(0.5),
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
          style: GoogleFonts.sirinStencil(
            fontSize: 32,
            color: Colors.blue,
            backgroundColor: Colors.black.withOpacity(0.5),
          )
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

class HoverImage extends StatelessWidget {
final int index;
HoverImage({required this.index});
  WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(builder: (context,state){
      return  MouseRegion(
        onEnter: ((pointer)=>cubit(context).launchInBrowser(googleUri)),
        onHover: ((pointer)=> cubit(context).changeHoverVisibility(hover: true,index: index-1) ),
        onExit: ((pointer)=>cubit(context).changeHoverVisibility(hover: false,index: index-1)),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                child: Image.asset('assets/images/sun.jpg',width: 300,height: 300,fit: BoxFit.fitHeight,)),
            Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Visibility(
                  visible: cubit(context).isHover[index-1],
                  child: Container(

                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    // height: double.infinity,
                    child:Center(
                      child: Text('this hover text widget ',style: TextStyle(
                          color:Colors.white
                      ),),
                    ),
                  ),
                ))

          ],
        ),
      );
    }, listener: (context,state){});
  }}
class LinksRow extends StatelessWidget {
  const LinksRow({super.key});
WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(
      builder: (context,state){
        return  Row(
          mainAxisSize: MainAxisSize.min,
          children: [
           ScalingLinksImage(
             uri: linkedInUri,
             imagePath: 'assets/images/linkedIn.png',
             index: 0,
           ),
            SizedBox(width: 10,),
            ScalingLinksImage(
             uri: googleUri,
             imagePath: 'assets/images/facebooklogo.png',
             index: 1,
           ),
            SizedBox(width: 10,),
            ScalingLinksImage(
             uri: googleUri,
             imagePath: 'assets/images/gitHub.png',
             index: 2,
           ),
          ],
        );
      },
      listener: (context,state){},
    );
  }
}

class ScalingLinksImage extends StatelessWidget {
final int index;
final Uri uri;
final String imagePath;
ScalingLinksImage({required this.index,required this.imagePath,required this.uri});

WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(builder: (context,state){
      return  MouseRegion(
        onEnter: ((pointer)=>
            cubit(context).changeSizeOnHover(hover: true, index: index)
        ),
        onExit: ((pointer)=>
            cubit(context).changeSizeOnHover(hover: false, index: index)
        ),
        child: GestureDetector(
          onTap:(){cubit(context).launchInBrowser(uri);} ,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey,
              ),
              padding: EdgeInsets.all(7),
              width: 34,
              height: 34,
              transform: Matrix4.identity()..scale(cubit(context).reSize[index]?1.2 : 1.0,cubit(context).reSize[index]?1.2 : 1.0),
              child: Image.asset(imagePath,fit: BoxFit.contain,)),
        ),
      );
    }, listener: (context,state){});
  }
}


