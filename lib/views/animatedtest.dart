import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/shared/components.dart';
import 'package:muhannadwebsite/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../models/navigator.dart';

class HoverText extends StatelessWidget {
  const HoverText({super.key,required this.index,required this.title,required this.date,required this.source, required this.summary});
  final int index;
  final String title;
  final String summary;
  final String date;
  final String source;
WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(builder: (context,state){
      return Center(
        child: MouseRegion(
          onEnter: ((pointer)=>cubit(context).changeHoveringOnText(hover: true, index: index)),
          onExit: ((pointer)=>cubit(context).changeHoveringOnText(hover: false, index: index)),
          child: Column(children: [
            Visibility(
              visible: cubit(context).hoveringOnText[index],
              child: Container(
                padding:
                EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    color: lightBackGroundColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                    border:
                    Border.all(color: Colors.black.withOpacity(0.7))),
                child: Column(
                  children: [
                    Text(summary,style:Theme.of(context).textTheme.titleSmall,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(date, style: Theme.of(context).textTheme.titleSmall),
                        Text(source, style: Theme.of(context).textTheme.titleSmall)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall
            ),

          ]),
        ),
      );
    }, listener: (context,state){});
  }
}
