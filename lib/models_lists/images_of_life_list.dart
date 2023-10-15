import '../models/animated_photos_model.dart';

int currentIndex = -1;
List<AnimatedPhoto> imagesOfLifeList = [
  AnimatedPhoto(
      index: ++currentIndex,
      imagePath: 'assets/images/1.jpg',
      text:
          'LA,Usa,ejfoejfoejfoejfojeofjeofjoejfoefejfojefoejfoejfojeofjeofjeojfojefojefo'),
  AnimatedPhoto(
      index: ++currentIndex, imagePath: 'assets/images/2.jpg', text: 'LA,Usa'),
  AnimatedPhoto(
      index: ++currentIndex, imagePath: 'assets/images/1.jpg', text: 'LA,Usa'),
  AnimatedPhoto(
      index: ++currentIndex, imagePath: 'assets/images/4.jpg', text: 'LA,Usa'),
  AnimatedPhoto(
      index: ++currentIndex, imagePath: 'assets/images/4.jpg', text: 'LA,Usa'),
];
