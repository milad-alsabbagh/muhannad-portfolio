class CourseModel {
  final String date;
  final String source;
  final String title;
  final String summary;
  final String? courseImagePath;
  CourseModel(
      {required this.date,
      required this.source,
      required this.summary,
      required this.title,
      this.courseImagePath});
}
