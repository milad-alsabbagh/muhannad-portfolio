// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_portal/flutter_portal.dart';
// import 'package:gauge_indicator/gauge_indicator.dart';
// import 'package:muhannadwebsite/models_lists/skill_list.dart';
// import '../../../cubit/cubit.dart';
// import '../../../cubit/states.dart';
// import '../../../models/skill_model.dart';
// class OnHoverSkillText extends StatelessWidget {
//  const OnHoverSkillText ({super.key});
//   WebsiteCubit cubit(context)=>BlocProvider.of(context);
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<WebsiteCubit, WebsiteStates>(
//         builder: (context, state) {
//           return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: skillsList
//                   .map((e) => Padding(
//                     padding: const EdgeInsets.only(bottom: 15.0),
//                     child: PortalTarget(
//                       visible: cubit(context).hoveringOnSkills[e.index],
//                       anchor: const Aligned(
//                         follower: Alignment.bottomLeft,
//                         target: Alignment.topCenter,
//                       ),
//                       portalFollower: Material(
//                         elevation: 8,
//                         child: IntrinsicWidth(
//                           child: SkillPortalContainer(e: e),
//                         ),
//                       ),
//                       child: MouseRegion(
//                         onEnter: ((pointer) => cubit(context)
//                             .changeHoveringOnSkillText(
//                             hover: true, index: e.index)),
//                         onExit: ((pointer) => cubit(context)
//                             .changeHoveringOnSkillText(
//                             hover: false, index: e.index)),
//                         child:  Row(
//                           children: [
//                             AutoSizeText(e.skill,style: const TextStyle(fontWeight: FontWeight.w300),),
//                             SizedBox(width: 5,),
//                             e.imagePath!=null?
//                             CircleAvatar(
//                              radius: 12,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(3.0),
//                                 child: Image.asset(e.imagePath!,fit: BoxFit.contain,),
//                               ),
//                             ):SizedBox()
//                           ],
//                         ),

//                       ),
//                     ),
//                   ))
//                   .toList());
//         },
//         listener: (context, state) {});
//   }
// }
// class SkillPortalContainer extends StatelessWidget {
//   const SkillPortalContainer({super.key,required this.e});
// final SkillModel e;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       decoration: BoxDecoration(
//           color: Colors.blueGrey.withOpacity(0.5),
//           borderRadius: BorderRadius.circular(5)
//       ),
//       width: 120,
//       padding: const EdgeInsets.all(15),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AnimatedRadialGauge(
//               duration: const Duration(seconds: 2),
//               curve: Curves.easeIn,
//               builder: (context, child, value) => Center(
//                   child: Text(
//                     '${value.toInt()} %',
//                     style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
//                   )),
//               radius: 60,
//               value: e.proficiency.toDouble(),
//               axis:  GaugeAxis(
//                 min: 0,
//                 max: 100,
//                 degrees: 360,
//                 style: GaugeAxisStyle(
//                   thickness: 15,
//                   background: const Color(0xFF7D5260).withOpacity(0.4),
//                 ),
//                 pointer: const GaugePointer.needle(
//                   width: 0,
//                   height: 0,
//                   borderRadius: 16,
//                   color: Color(0xFF6750A4),
//                 ),
//                 progressBar:
//                 const GaugeProgressBar.rounded(color: Color(0xFF6750A4)),
//               )),
//           const SizedBox(height:10 ,),
//           Row(
//             children: [
//               const Text('Xp years:'),
//               const Spacer(),
//               Text('${e.yearOfXp}')

//             ],
//           )

//         ],
//       ),
//     );
//   }
// }
