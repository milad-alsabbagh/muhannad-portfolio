import 'package:auto_size_text/auto_size_text.dart';
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
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: certificates
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: PortalTarget(
                          visible: cubit(context).hoveringOnCertificates[e.index],
                          anchor: const Aligned(
                            follower: Alignment.bottomLeft,
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
                            child: AutoSizeText(e.title,style: const TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ))
                  .toList());
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
      constraints:const BoxConstraints(maxWidth: 300),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blueGrey.withOpacity(0.5),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(e.summary),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Source :${e.source}'),
              const SizedBox(height: 5,),
              Text('On :${e.date}')
            ],
          )
        ],
      ),
    );
  }
}

