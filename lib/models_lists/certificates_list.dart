import '../models/certificate_model.dart';

int currentIndex=-1;
List<CertificateModel> certificatesList = [
  CertificateModel(
      source: 'coursera',
      date: '328784',
      summary: 'thiscer oer ojeo joje ro',
      title: 'it specialist',
      index: ++currentIndex),
  CertificateModel(
      source: 'udemy',
      date: '328784',
      summary: 'this oer ojeo joje ro',
      title: 'flutter developer',
      index: ++currentIndex),
  CertificateModel(
      source: 'google ',
      date: '328784',
      summary: 'this is google certificate that is beginner tutorial for ux/ui designer',
      title: 'UX/UI Designer',
      index: ++currentIndex),
];
//make sure the index in any object is ++currentIndex