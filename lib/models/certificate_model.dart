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
List<CertificateModel> certificates = [
  CertificateModel(
      source: 'coursera',
      date: '328784',
      summary: 'thiscer oer ojeo joje ro',
      title: 'it specialist',
      index: 0),
  CertificateModel(
      source: 'udemy',
      date: '328784',
      summary: 'thiscer oer ojeo joje ro',
      title: 'flutter develooper',
      index: 1),
];