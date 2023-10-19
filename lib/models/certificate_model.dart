class CertificateModel {
  final String date;
  final String source;
  final String title;
  final String summary;
  final String? courseImagePath;
  CertificateModel(
      {required this.date,
      required this.source,
      required this.summary,
      required this.title,
      this.courseImagePath});
}
