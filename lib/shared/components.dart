import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import '../models/animated_photos_model.dart';

//animated text widget that return greeting message





//animated row that return navigation button to the pages in the website
//********************************************




class HoverImage extends StatelessWidget {
AnimatedPhoto e;
HoverImage({required this.e});
  WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(builder: (context,state){
      return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                    child: Image.asset(e.imagePath,width: 300,height: 700,fit: BoxFit.cover
                      ,)),
                Visibility(
                  visible: true,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 300,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                      color:Color(0xFF6750A4).withOpacity(0.6),
                    ),
                    child:e.text!=null? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 20),
                      child: Text(e.text!,style: TextStyle(
                          color:Colors.black,
                        fontSize: 16,

                      ),),
                    ):SizedBox(),
                  ),
                )
              ],
            ),
      );
    }, listener: (context,state){});
  }}



