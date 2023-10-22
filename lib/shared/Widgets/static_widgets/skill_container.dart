import 'package:flutter/material.dart';

import '../../../models/skill_model.dart';

class SkillContaienr extends StatelessWidget {
  const SkillContaienr({super.key, required this.skillModel});
  final SkillModel skillModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        width: 280,
        child: Column(children: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Image(
                    image: AssetImage(skillModel.skillLogoImagePath),
                    width: 40,
                    height: 40,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 220,
                  child: Text(
                    skillModel.title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.blueGrey,
          ),
          Container(
            height: 200,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Text(skillModel.summary),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
