import '../models/certificate_model.dart';

int currentIndex = -1;
List<CertificateModel> certificatesList = [
  CertificateModel(
      source: 'Coursera',
      date: 'Sep-16-2022',
      summary: 'Coming soon',
      title: 'Google IT Support',
      index: ++currentIndex),
  CertificateModel(
      source: 'Coursera',
      date: 'Sep-13-2023',
      summary: 'Coming Soon',
      title: 'Introduction to Docker',
      index: ++currentIndex),
  CertificateModel(
      source: 'Coursera',
      date: 'Jul-11-2023',
      summary: 'Coming Soon',
      title: 'AWS Cloud Practitinr Essentials',
      index: ++currentIndex),
  CertificateModel(
      source: 'Coursera',
      date: 'ON going',
      summary: 'Coming Soon',
      title: 'Google Data Analytics Profeessional Certificte',
      index: ++currentIndex),
  CertificateModel(
      source: 'Udemy',
      date: 'On going',
      summary: 'Coming Soon',
      title: 'Django',
      index: ++currentIndex),
];
//make sure the index in any object is ++currentIndex