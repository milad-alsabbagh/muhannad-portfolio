// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';

import '../../../models/link_model.dart';
import '../../../models_lists/links_list.dart';

enum Direction { horizontal, vertical }

class AnimatedLinksContainer extends StatelessWidget {
  AnimatedLinksContainer({super.key, required this.direction});
  WebsiteCubit cubit(context) => BlocProvider.of(context);
  List<LinkModel> link = linksList;
  final Direction direction;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..scale(cubit(context).rowContainer ? 1.1 : 1.0,
                cubit(context).rowContainer ? 1.1 : 1.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.2),
            border: Border.all(
              color: const Color(0xFF6750A4).withOpacity(0.5),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
            // color: Colors.blueAccent.withOpacity(0.2)
          ),
          padding: direction == Direction.horizontal
              ? const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10)
              : const EdgeInsets.only(left: 10, top: 20, bottom: 10, right: 10),
          child: direction == Direction.horizontal
              ? LinksRow(links: link)
              : LinksColumn(links: link),
        );
      },
      listener: (context, state) {},
    );
  }
}

class LinksRow extends StatelessWidget {
  LinksRow({super.key, required this.links, this.isHome = true});
  List<LinkModel> links;
  final bool isHome;
  WebsiteCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
      builder: (context, state) {
        return Row(
            mainAxisSize: MainAxisSize.min,
            children: links
                .map((e) => Row(
                      children: [
                        ScalingLinksImage(
                          isHome: isHome,
                          uri: e.uri,
                          imagePath: e.imagePath,
                          index: e.index,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ))
                .toList());
      },
      listener: (context, state) {},
    );
  }
}

class LinksColumn extends StatelessWidget {
  LinksColumn({super.key, required this.links, this.isHome = true});
  List<LinkModel> links;
  final bool isHome;
  WebsiteCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
      builder: (context, state) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            children: links
                .map((e) => Column(
                      children: [
                        ScalingLinksImage(
                          isHome: isHome,
                          uri: e.uri,
                          imagePath: e.imagePath,
                          index: e.index,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ))
                .toList());
      },
      listener: (context, state) {},
    );
  }
}

class ScalingLinksImage extends StatelessWidget {
  final int index;
  final Uri uri;
  final String imagePath;
  final bool isHome;
  const ScalingLinksImage(
      {super.key,
      required this.isHome,
      required this.index,
      required this.imagePath,
      required this.uri});

  WebsiteCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return MouseRegion(
            onEnter: ((pointer) =>
                cubit(context).changeSizeOnHover(hover: true, index: index)),
            onExit: ((pointer) =>
                cubit(context).changeSizeOnHover(hover: false, index: index)),
            child: GestureDetector(
              onTap: () {
                cubit(context).launchInBrowser(uri);
              },
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: isHome == true
                        ? BorderRadius.circular(40)
                        : BorderRadius.circular(5),
                    color: isHome == true
                        ? const Color(0xFF6750A4).withOpacity(0.4)
                        : Colors.white.withOpacity(0.2),
                  ),
                  padding: const EdgeInsets.all(7),
                  width: 34,
                  height: 34,
                  transform: Matrix4.identity()
                    ..scale(cubit(context).reSize[index] ? 1.2 : 1.0,
                        cubit(context).reSize[index] ? 1.2 : 1.0),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  )),
            ),
          );
        },
        listener: (context, state) {});
  }
}
