import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';
import '../../../models/skill_model.dart';
class OnHoverSkillText extends StatelessWidget {
  final List<SkillModel> skills;
  OnHoverSkillText ({required this.skills});
  WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: skills
                  .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: PortalTarget(
                      fit: StackFit.loose,
                      visible: cubit(context).hoveringOnSkills[e.index],
                      anchor: const Aligned(
                        follower: Alignment.bottomCenter,
                        target: Alignment.topCenter,
                      ),
                      portalFollower: Material(
                        elevation: 8,
                        child: IntrinsicWidth(
                          child: SkillPortalContainer(e: e),
                        ),
                      ),
                      child: MouseRegion(
                        onEnter: ((pointer) => cubit(context)
                            .changeHoveringOnSkillText(
                            hover: true, index: e.index)),
                        onExit: ((pointer) => cubit(context)
                            .changeHoveringOnSkillText(
                            hover: false, index: e.index)),
                        child:  Text(e.skill,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),

                      ),
                    ),
                  ))
                  .toList());
        },
        listener: (context, state) {});
  }
}
class SkillPortalContainer extends StatelessWidget {
  const SkillPortalContainer({super.key,required this.e});
final SkillModel e;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5)
      ),
      width: 120,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedRadialGauge(
              duration: const Duration(seconds: 2),
              curve: Curves.easeIn,
              builder: (context, child, value) => Center(
                  child: Text(
                    '${value.toInt()} %',
                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                  )),
              radius: 60,
              value: e.proficiency.toDouble(),
              axis:  GaugeAxis(
                min: 0,
                max: 100,
                degrees: 360,
                style: GaugeAxisStyle(
                  thickness: 15,
                  background: const Color(0xFF7D5260).withOpacity(0.4),
                ),
                pointer: const GaugePointer.needle(
                  width: 0,
                  height: 0,
                  borderRadius: 16,
                  color: Color(0xFF6750A4),
                ),
                progressBar:
                const GaugeProgressBar.rounded(color: Color(0xFF6750A4)),
              )),
          const SizedBox(height:10 ,),
          Row(
            children: [
              const Text('Xp years:'),
              const Spacer(),
              Text('${e.yearOfXp}')

            ],
          )

        ],
      ),
    );
  }
}
