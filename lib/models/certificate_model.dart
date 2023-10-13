class CertificateModel {
  final String title;
  final String summary;
  final String date;
  final String source;
  final int index;
  CertificateModel(
      {required this.source,
      required this.date,
      required this.summary,
      required this.title,
      required this.index});
}
