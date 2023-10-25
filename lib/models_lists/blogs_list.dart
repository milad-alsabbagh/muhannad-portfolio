import 'package:muhannadwebsite/models/blog_model.dart';

String viewMode = '&rm=minimal';
List<BlogModel> blogsList = [
  BlogModel(
      uri: Uri.parse(
          'https://docs.google.com/presentation/d/1wZZR6gW65X9RJCPkh57ama4qpnfAKGUC/edit?usp=sharing&ouid=101406648586825012377&rtpof=true&sd=true$viewMode'),
      blogText:
          'dart langauge is powerfull programming language supported by google and announced in 2018 it has many good feauture that mak',
      date: 'june 8 2018',
      imagePath: 'assets/images/cover.jpeg',
      title: 'somethimg about dart '),
  BlogModel(
      uri: Uri.parse(
          'https://docs.google.com/presentation/d/1wZZR6gW65X9RJCPkh57ama4qpnfAKGUC/edit?usp=sharing&ouid=101406648586825012377&rtpof=true&sd=true$viewMode'),
      blogText:
          'dart langauge is powerfull programming language supported by google and announced in 2018 it has many good feauture that mak',
      date: 'june 8 2018',
      imagePath: 'assets/images/cover.jpeg',
      title: 'somethimg about dart '),
  BlogModel(
      uri: Uri.parse(
          'https://docs.google.com/presentation/d/1wZZR6gW65X9RJCPkh57ama4qpnfAKGUC/edit?usp=sharing&ouid=101406648586825012377&rtpof=true&sd=true$viewMode'),
      blogText:
          'dart langauge is powerfull programming language supported by google and announced in 2018 it has many good feauture that mak',
      date: 'june 8 2018',
      imagePath: 'assets/images/cover.jpeg',
      title: 'somethimg about dart '),
];
//to open power point file in slide show make sure to add $viewMode to the end of Uri.parse String 