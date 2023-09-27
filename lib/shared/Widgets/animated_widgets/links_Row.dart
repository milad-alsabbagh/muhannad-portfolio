import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';
import '../../../models/link_model.dart';

class LinksRow extends StatelessWidget {
  LinksRow({super.key,required this.links});
  List<LinkModel> links;
  WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(
      builder: (context,state){
        return  Row(
          mainAxisSize: MainAxisSize.min,
          children: links.map((e) => Row(
            children: [
              ScalingLinksImage(
                uri: e.uri,
                imagePath: e.imagePath,
                index: e.index,
              ),
              SizedBox(width: 10,),
            ],
          )).toList()
        );
      },
      listener: (context,state){},
    );
  }
}

class ScalingLinksImage extends StatelessWidget {
  final int index;
  final Uri uri;
  final String imagePath;
  ScalingLinksImage({required this.index,required this.imagePath,required this.uri});

  WebsiteCubit cubit(context)=>BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(builder: (context,state){
      return  MouseRegion(
        onEnter: ((pointer)=>
            cubit(context).changeSizeOnHover(hover: true, index: index)
        ),
        onExit: ((pointer)=>
            cubit(context).changeSizeOnHover(hover: false, index: index)
        ),
        child: GestureDetector(
          onTap:(){cubit(context).launchInBrowser(uri);} ,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey,
              ),
              padding: EdgeInsets.all(7),
              width: 34,
              height: 34,
              transform: Matrix4.identity()..scale(cubit(context).reSize[index]?1.2 : 1.0,cubit(context).reSize[index]?1.2 : 1.0),
              child: Image.asset(imagePath,fit: BoxFit.contain,)),
        ),
      );
    }, listener: (context,state){});
  }
}