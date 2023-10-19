import 'package:flutter/material.dart';
import 'package:muhannadwebsite/shared/constants.dart';

import '../../../models/blog_model.dart';

class BlogContainer extends StatelessWidget {
  const BlogContainer({super.key, required this.blogModel});
  final BlogModel blogModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        width: 280,
        child: Column(children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Image(
              width: 280,
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
          SizedBox(
            height: 5,
          ),
          Text(
            blogModel.title,
            style: TextStyle(
                color: niceGreen, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Text(blogModel.blogText),
              ),
            ),
          ),
          const Divider(
            color: Colors.blueGrey,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              children: [
                Text(blogModel.date),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
