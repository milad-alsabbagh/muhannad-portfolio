// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';
import '../../../models/animated_photos_model.dart';

class HoverImage extends StatelessWidget {
  final AnimatedPhoto animatedPhoto;
  final double width;
  HoverImage({super.key, required this.animatedPhoto, required this.width});
  WebsiteCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return MouseRegion(
            onEnter: (pointer) {
              cubit(context).changeOnHoverImagesOflifeVisibility(
                  hover: true, index: animatedPhoto.index);
            },
            onExit: (pointer) {
              cubit(context).changeOnHoverImagesOflifeVisibility(
                  hover: false, index: animatedPhoto.index);
            },
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                ColorFiltered(
                  colorFilter:
                      cubit(context).hoveringOnImagesOfLife[animatedPhoto.index]
                          ? const ColorFilter.mode(
                              Colors.transparent,
                              BlendMode.multiply,
                            )
                          : const ColorFilter.mode(
                              Colors.grey,
                              BlendMode.saturation,
                            ),
                  child: Image.asset(
                    animatedPhoto.imagePath,
                    fit: BoxFit.fill,
                    width: 500,
                    height: 900,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.grey,
                              ),
                              Text(animatedPhoto.location)
                            ]),
                      ),
                    ),
                    const Spacer(),
                    Visibility(
                      visible: cubit(context)
                          .hoveringOnImagesOfLife[animatedPhoto.index],
                      child: Container(
                        width: width,
                        color: Colors.black.withOpacity(0.3),
                        child: animatedPhoto.text != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 20),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  animatedPhoto.text!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
