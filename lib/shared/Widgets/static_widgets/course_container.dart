import 'package:flutter/material.dart';

import '../../../models/course_model.dart';

class CourseContainer extends StatelessWidget {
  const CourseContainer({super.key, required this.courseModel});
  final CourseModel courseModel;
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                courseModel.courseImagePath != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 5),
                        child: Image(
                          image: AssetImage(courseModel.courseImagePath!),
                          width: 40,
                          height: 40,
                        ),
                      )
                    : SizedBox(),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 220,
                  child: Text(
                    courseModel.title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.blueGrey,
          ),
          SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Text(courseModel.summary),
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
                Text(courseModel.date),
                const Spacer(),
                Text(courseModel.source),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
