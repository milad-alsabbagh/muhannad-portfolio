import 'package:muhannadwebsite/markDown_files/dockerMD.dart';
import 'package:muhannadwebsite/markDown_files/markdownex.dart';
import 'package:muhannadwebsite/models/blog_model.dart';

String viewMode = '&rm=minimal';
List<BlogModel> blogsList = [
  BlogModel(
      uri: Uri.parse('https://milad-alsabbagh13.github.io/blogFiles/'),
      blogText:
          'dart langauge is powerfull programming language supported by google and announced in 2018 it has many good feauture that mak',
      date: 'june 8 2018',
      imagePath: 'assets/images/cover.jpeg',
      title: 'somethimg about dart '),
  BlogModel(
      uri: Uri.parse('https://milad-alsabbagh13.github.io/blogFiles/topic_B'),
      blogText:
          'dart langauge is powerfull programming language supported by google and announced in 2018 it has many good feauture that mak',
      date: 'june 8 2018',
      imagePath: 'assets/images/cover.jpeg',
      title: 'somethimg about dart '),
  BlogModel(
      uri: Uri.parse('https://milad-alsabbagh13.github.io/blogFiles/topic_C'),
      blogText:
          'dart langauge is powerfull programming language supported by google and announced in 2018 it has many good feauture that mak',
      date: 'june 8 2018',
      imagePath: 'assets/images/cover.jpeg',
      title: 'somethimg about dart '),
];
//to open power point file in slide show make sure to add $viewMode to the end of Uri.parse String 