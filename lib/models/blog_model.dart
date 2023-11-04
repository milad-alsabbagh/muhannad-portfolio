class BlogModel {
  final String imagePath;
  final String title;
  final String blogText;
  final String date;
  final Uri uri;
  final String markDownData;
  BlogModel(
      {required this.uri,
      required this.markDownData,
      required this.blogText,
      required this.date,
      required this.imagePath,
      required this.title});
}
