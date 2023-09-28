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
                                child:CertificatePortalContainer(e: e,) ,
                              ),
                            ),
                            child: MouseRegion(
                              onEnter: ((pointer) => cubit(context)
                                  .changeHoveringOnCertificateText(
                                      hover: true, index: e.index)),
                              onExit: ((pointer) => cubit(context)
                                  .changeHoveringOnCertificateText(
                                      hover: false, index: e.index)),
                              child: Text(e.title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                            ),
                          ),
                        ))
                    .toList()),
          );
        },
        listener: (context, state) {});
  }
}
class CertificatePortalContainer extends StatelessWidget {
  const CertificatePortalContainer({super.key,required this.e});
final CertificateModel e;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blueGrey.withOpacity(0.5),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(e.summary),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(e.source),
              const Spacer(),
              Text(e.date)
            ],
          )
        ],
      ),
    );
  }
}

