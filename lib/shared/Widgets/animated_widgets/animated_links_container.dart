import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';

import '../../../models/link_model.dart';
import '../../../models_lists/links_list.dart';
import 'links_Row.dart';
class AnimatedLinksContainer extends StatelessWidget {
   AnimatedLinksContainer({super.key});
WebsiteCubit cubit(context)=>BlocProvider.of(context);
  List<LinkModel>link =linksList;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebsiteCubit,WebsiteStates>(
      builder:(context,state){
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..scale(cubit(context).rowContainer ? 1.2 : 1.0,
                cubit(context).rowContainer ? 1.2 : 1.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF6750A4).withOpacity(0.5),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
            // color: Colors.blueAccent.withOpacity(0.2)
          ),
          padding:
          EdgeInsets.only(left: 20, top: 10,bottom: 10,right: 10),
          child: LinksRow(links: link),
        );
      },
      listener: (context,state){},
    );
  }
}
