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
import 'package:gauge_indicator/gauge_indicator.dart';
import '../models/navigator.dart';

class AnimatedTest extends StatelessWidget {
  // const HoverText({super.key,required this.index,required this.title,required this.date,required this.source, required this.summary});
  // final int index;
  // final String title;
  // final String summary;
  // final String date;
  // final String source;
  WebsiteCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return Center(
              child: AnimatedRadialGauge(
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeIn,
                  builder: (context, child, value) => Center(
                          child: Text(
                        '${value.toInt()} %',
                        style: const TextStyle(fontSize: 14),
                      )),
                  radius: 60,
                  value: 30,
                  axis: const GaugeAxis(
                    min: 0,
                    max: 100,
                    degrees: 360,
                    style: GaugeAxisStyle(
                      thickness: 20,
                      background: Color(0xFF7D5260),
                    ),
                    pointer: GaugePointer.needle(
                      width: 0,
                      height: 0,
                      borderRadius: 16,
                      color: Color(0xFF6750A4),
                    ),
                    progressBar:
                        GaugeProgressBar.rounded(color: Color(0xFF6750A4)),
                  )));
        },
        listener: (context, state) {});
  }
}
