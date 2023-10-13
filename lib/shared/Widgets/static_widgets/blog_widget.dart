import 'package:flutter/material.dart';
import 'package:muhannadwebsite/models/blog_model.dart';

class BlogWidget extends StatelessWidget {
  BlogWidget({super.key, required this.blog});
  BlogModel blog;
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 130,
        decoration: BoxDecoration(
            color: Color(0xff272B2A), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Image(
              image: AssetImage(blog.imagePath),
              width: 200,
              fit: BoxFit.fill,
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 30,
                  maxHeight: currentWidth > 1117 ? 150 : 90,
                ),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            blog.title,
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 18),
                          ),
                          Text(blog.blogText),
                        ]),
                  ),
                ),
              ),
            ),
            Spacer(),
            Divider(),
            Text(blog.date),
          ],
        ),
      ),
    );
  }
}
