import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';

import 'new_home_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    // final currentWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<WebsiteCubit, WebsiteStates>(
        builder: (context, state) {
          return LayoutBuilder(builder: (context, constraints) {
            if (constraints.minWidth > 700) {
              return const NewDesktopView();
            } else {
              return const NewDesktopView();
            }
          });
        },
        listener: (context, state) {});
  }
}
