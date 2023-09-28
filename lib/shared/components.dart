import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../models/navigator.dart';

//animated text widget that return greeting message





//animated row that return navigation button to the pages in the website
//********************************************




class HoverImage extends StatelessWidget {
final int index;
HoverImage({required this.index});
  WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(builder: (context,state){
      return  MouseRegion(
        onEnter: ((pointer)=>cubit(context).launchInBrowser(googleUri)),
        onHover: ((pointer)=> cubit(context).changeHoverVisibility(hover: true,index: index-1) ),
        onExit: ((pointer)=>cubit(context).changeHoverVisibility(hover: false,index: index-1)),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                child: Image.asset('assets/images/sun.jpg',width: 300,height: 300,fit: BoxFit.fitHeight,)),
            Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Visibility(
                  visible: cubit(context).isHover[index-1],
                  child: Container(

                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    // height: double.infinity,
                    child:const Center(
                      child: Text('this hover text widget ',style: TextStyle(
                          color:Colors.white
                      ),),
                    ),
                  ),
                ))

          ],
        ),
      );
    }, listener: (context,state){});
  }}



