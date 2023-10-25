import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:lottie/lottie.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/models/hover_skill_model.dart';

class HoverSkillContainer extends StatelessWidget {
  const HoverSkillContainer({super.key, required this.hoverSkill});
  final HoverSkill hoverSkill;
  WebsiteCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return PortalTarget(
          visible: cubit(context).hoverOnSkillCircleAvatar[hoverSkill.index],
          anchor: const Aligned(
            follower: Alignment.bottomCenter,
            target: Alignment.topCenter,
          ),
          portalFollower: Material(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                color: Colors.white.withOpacity(0.1),
                child: Image(
                  image: AssetImage(hoverSkill.certificateImagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          child: MouseRegion(
              onEnter: (event) {
                cubit(context).hoverOnSkillAvatar(hoverSkill.index, true);
              },
              onExit: (event) {
                cubit(context).hoverOnSkillAvatar(hoverSkill.index, false);
              },
              child: SkillCircleAvatar(hoverSkill: hoverSkill)),
        );
      },
    );
  }
}

class SkillCircleAvatar extends StatelessWidget {
  const SkillCircleAvatar({
    super.key,
    required this.hoverSkill,
  });

  final HoverSkill hoverSkill;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.white)),
      child: hoverSkill.lottieAnimationPath != null
          ? Lottie.asset(hoverSkill.lottieAnimationPath!)
          : Image(
              image: AssetImage(hoverSkill.alternativeImagePath!),
              fit: BoxFit.contain,
            ),
    );
  }
}

// to check first if lottie animation is empty 
// add index to hoverSkill model
// add list in cubit for hover on skill



// Container(
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(width: 2, color: Colors.white)),
//             child: CircleAvatar(
//               backgroundColor: Colors.transparent,
//               radius: 70,
//               child: Lottie.asset(hoverSkill.lottieAnimationPath!),
//             ),
//           ),