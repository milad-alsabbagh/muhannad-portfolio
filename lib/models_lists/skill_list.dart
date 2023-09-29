import '../models/skill_model.dart';

int currentIndex = -1;
List<SkillModel> skillsList = [
  SkillModel(
      index: ++currentIndex, proficiency: 90, skill: 'Python', yearOfXp: 3),
  SkillModel(
      index: ++currentIndex, proficiency: 50, skill: 'Docker', yearOfXp: 3),
  SkillModel(
      index: ++currentIndex, proficiency: 50, skill: 'Kubernetes', yearOfXp: 3),
  SkillModel(
      index: ++currentIndex, proficiency: 75, skill: 'Django', yearOfXp: 3),
  SkillModel(
      index: ++currentIndex, proficiency: 95, skill: 'IT.Support', yearOfXp: 5),
  SkillModel(
      index: ++currentIndex,
      proficiency: 90,
      skill: 'Project Management',
      imagePath: 'assets/images/linkedIn.png',
      yearOfXp: 5),
];
