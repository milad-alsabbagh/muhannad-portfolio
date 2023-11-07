import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/shared/constants.dart';

import '../../../models/blog_model.dart';

class BlogContainer extends StatelessWidget {
  const BlogContainer({super.key, required this.blogModel});
  final BlogModel blogModel;
  WebsiteCubit cubit(context) => BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            width: 250,
            child: Column(children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Image(
                  width: 250,
                  height: 100,
                  fit: BoxFit.cover,
                  image: AssetImage(blogModel.imagePath),
                ),
              ),
              Container(
                height: 2,
                width: 280,
                color: Colors.blueGrey,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                blogModel.title,
                style: const TextStyle(
                    color: niceGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 190,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Text(
                          blogModel.blogText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: Row(
                          children: [
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  border: Border.all(color: niceGreen),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 40,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      AnimatedTextKit(
                                          repeatForever: true,
                                          animatedTexts: [
                                            ColorizeAnimatedText(
                                              'Read More',
                                              textStyle: colorizeTextStyle,
                                              colors: colorizeColors,
                                            ),
                                          ]),
                                      InkWell(
                                        onTap: () {
                                          cubit(context)
                                              .launchInBrowser(blogModel.uri);
                                        },
                                        child: const Text(
                                          'Read More',
                                          style: TextStyle(
                                              color: Colors.transparent,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ]),
          ),
        );
      },
    );
  }
}

//  cubit(context).launchInBrowser(blogModel.uri);