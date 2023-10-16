import '../models/animated_photos_model.dart';

int currentIndex = -1;
List<AnimatedPhoto> imagesOfLifeList = [
  AnimatedPhoto(
      index: ++currentIndex,
      imagePath: 'assets/images/1.jpg',
      location: 'LA,California',
      text:
          'LA,Usa,ejfoejfoejfoejfojeofjeofjoejfoefejfojefoejfoejfojeofjeofjeojfojefojefo'),
  AnimatedPhoto(
      location: 'Dubai,UAE',
      index: ++currentIndex,
      imagePath: 'assets/images/docker.png',
      text: 'LA,Usa'),
  AnimatedPhoto(
      location: 'Maldif',
      index: ++currentIndex,
      imagePath: 'assets/images/1.jpg',
      text: 'LA,Usa'),
  AnimatedPhoto(
      location: 'NewYork,USA',
      index: ++currentIndex,
      imagePath: 'assets/images/4.jpg',
      text: 'LA,Usa'),
  AnimatedPhoto(
      location: 'Miame,USA',
      index: ++currentIndex,
      imagePath: 'assets/images/4.jpg',
      text: 'LA,Usa'),
];
