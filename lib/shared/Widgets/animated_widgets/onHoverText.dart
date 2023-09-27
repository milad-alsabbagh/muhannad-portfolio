import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';

import '../../../models/certificate_model.dart';

class OnHoverText extends StatelessWidget {
  const OnHoverText({super.key,required this.certificates});
final List<CertificateModel> certificates;
WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(builder: (context,state){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children:certificates.map((e) => Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: PortalTarget(
                visible:cubit(context).hoveringOnText[e.index],
                anchor: const Aligned(
                  follower: Alignment.topLeft,
                  target: Alignment.topRight,
                ),
                portalFollower: Material(
              elevation: 8,
              child: IntrinsicWidth(
                child: Container(
                  color: Colors.blueGrey.withOpacity(0.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(e.summary),
                      Row(
                        children: [
                          Text(e.source),
                          Text(e.date)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
              child: MouseRegion(
                child: Text(e.title),
                onEnter: ((pointer)=>cubit(context).changeHoveringOnText(hover: true, index: e.index)),
                onExit: ((pointer)=>cubit(context).changeHoveringOnText(hover: false, index: e.index)),
              ),

                 ),
          )).toList()
      );
    }, listener: (context,state){});
  }
}
// PortalTarget(
// visible: isHover,
// anchor: const Aligned(
// follower: Alignment.topLeft,
// target: Alignment.topRight,
// ),
// portalFollower: Material(
// elevation: 8,
// child: IntrinsicWidth(
// child: Container(
// color: Colors.black,
// child: Column(
// mainAxisSize: MainAxisSize.min,
// children: [
// ListTile(title: Text('option 1',style: TextStyle(color: Colors.white),)),
// ListTile(title: Text('option 2')),
// ],
// ),
// ),
// ),
// ),
// child: MouseRegion(child: Text('Hover me',style: TextStyle(fontSize: 14,color: Colors.black,inherit: false),),
// onEnter: ((pointer)=>setState(() {
// isHover=true;
// })),
// onExit: ((pointer)=>setState(() {
// isHover=false;
// })),
// )
// ),