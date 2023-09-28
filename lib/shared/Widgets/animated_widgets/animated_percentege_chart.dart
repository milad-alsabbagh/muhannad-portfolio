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
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5)
                            ),

                            width: 120,
                            padding: EdgeInsets.all(15),
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
                                        background: Color(0xFF7D5260).withOpacity(0.4),
                                      ),
                                      pointer: GaugePointer.needle(
                                        width: 0,
                                        height: 0,
                                        borderRadius: 16,
                                        color: Color(0xFF6750A4),
                                      ),
                                      progressBar:
                                      GaugeProgressBar.rounded(color: Color(0xFF6750A4)),
                                    )),
                                SizedBox(height:10 ,),
                                Row(
                                  children: [
                                    Text('Xp years:'),
                                    Spacer(),
                                    Text('${e.yearOfXp}')

                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                      ),
                      child: MouseRegion(
                        child: Text(e.skill,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                        onEnter: ((pointer) => cubit(context)
                            .changeHoveringOnSkillText(
                            hover: true, index: e.index)),
                        onExit: ((pointer) => cubit(context)
                            .changeHoveringOnSkillText(
                            hover: false, index: e.index)),
                      ),
                    ),
                  ))
                  .toList());
        },
        listener: (context, state) {});
  }
}
