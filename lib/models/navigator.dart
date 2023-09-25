import 'package:flutter/material.dart';
class NavigatorTextButtons{
  final String text;
  final BuildContext context;
  final Widget screen;
  NavigatorTextButtons({required this.context,required this.screen,required this.text});
  void onPressed(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return screen;
    }));
  }
}