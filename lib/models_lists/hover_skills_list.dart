import 'package:muhannadwebsite/models/hover_skill_model.dart';

int currentIndex = -1;
List<HoverSkill> hoverSkillsList = [
  HoverSkill(
    index: ++currentIndex,
    certificateImagePath: 'assets/images/docker.png',
    alternativeImagePath: 'assets/images/docker.png',
  ),
  HoverSkill(
      index: ++currentIndex,
      certificateImagePath: 'assets/images/aws_certificate.PNG',
      lottieAnimationPath: 'assets/lottie/dockerAnimation.json'),
  HoverSkill(
      index: ++currentIndex,
      certificateImagePath: 'assets/images/aws_certificate.PNG',
      lottieAnimationPath: 'assets/lottie/dockerAnimation.json'),
];
// if you don't have lottie animation file for the skill you have to add alternativeImagePath 
