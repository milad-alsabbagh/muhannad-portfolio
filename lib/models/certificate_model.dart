import 'package:flutter/material.dart';
class CertificateModel{
  final String title;
  final String summary;
  final String date;
  final String source;
  final int index;
  CertificateModel({required this.source,required this.date,required this.summary,required this.title,required this.index
  });

}
int currentIndex=-1;
List<CertificateModel> certificates = [
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