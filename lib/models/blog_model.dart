class BlogModel {
  final String imagePath;
  final String title;
  final String blogText;
  final String date;
  final Uri uri;
  BlogModel(
      {required this.uri,
      required this.blogText,
      required this.date,
      required this.imagePath,
      required this.title});
}
