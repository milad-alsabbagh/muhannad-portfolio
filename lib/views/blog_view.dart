import 'package:flutter/material.dart';
import 'package:muhannadwebsite/models_lists/blogs_list.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final double runSpacing = 30;
    final double spacing = 20;
    final columns = currentWidth > 950 ? 3 : 2;
    final w =
        ((MediaQuery.of(context).size.width - runSpacing * (columns - 1)) /
                columns) -
            20;
    return Scaffold(
      appBar: MyAppBar(
        isHome: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: runSpacing,
            spacing: spacing,
            alignment: WrapAlignment.center,
            children: List.generate(blogs_list.length, (index) {
              return Column(
                children: [
                  Container(
                    width: w,
                    height: w / 4,
                    decoration: BoxDecoration(
                        color: const Color(0xff272B2A),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Image(
                      image: AssetImage(blogs_list[index].imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Colors.grey,
                    width: w,
                    height: 2,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: w,
                    color: const Color(0xff272B2A),
                    child: Text(
                      blogs_list[index].title,
                      style: TextStyle(color: Color(0xff29D6B6), fontSize: 20),
                    ),
                  ),
                  Container(
                    width: w,
                    height: w / 2,
                    color: const Color(0xff272B2A),
                    child: SingleChildScrollView(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 5, bottom: 5.0),
                      child: Text(
                        blogs_list[index].blogText,
                        style: TextStyle(fontSize: 18),
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Colors.grey,
                    width: w,
                    height: 2,
                  ),
                  Container(
                      width: w,
                      padding: EdgeInsets.only(top: 5, bottom: 5, left: 15),
                      decoration: BoxDecoration(
                          color: const Color(0xff272B2A),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Text(blogs_list[index].date))
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
