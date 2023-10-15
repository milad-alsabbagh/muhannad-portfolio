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
              alignment: AlignmentDirectional.bottomCenter,
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
                )
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
