import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';

import '../../../models/certificate_model.dart';

class OnHoverCertificateText extends StatelessWidget {
  const OnHoverCertificateText({super.key, required this.certificates});
  final List<CertificateModel> certificates;
  WebsiteCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: certificates
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: PortalTarget(
                            visible: cubit(context).hoveringOnCertificates[e.index],
                            anchor: const Aligned(
                              follower: Alignment.bottomCenter,
                              target: Alignment.topCenter,
                            ),
                            portalFollower: Material(
                              elevation: 8,
                              child: IntrinsicWidth(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blueGrey.withOpacity(0.5),
                                  ),

                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(e.summary),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text(e.source),
                                          Spacer(),
                                          Text(e.date)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            child: MouseRegion(
                              child: Text(e.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                              onEnter: ((pointer) => cubit(context)
                                  .changeHoveringOnCertificateText(
                                      hover: true, index: e.index)),
                              onExit: ((pointer) => cubit(context)
                                  .changeHoveringOnCertificateText(
                                      hover: false, index: e.index)),
                            ),
                          ),
                        ))
                    .toList()),
          );
        },
        listener: (context, state) {});
  }
}
