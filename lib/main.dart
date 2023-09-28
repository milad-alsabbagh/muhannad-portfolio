import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/shared/material_theme.dart';
import 'package:muhannadwebsite/views/home_view.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return WebsiteCubit()..fullBollsLists();
      },
      child: BlocConsumer<WebsiteCubit, WebsiteStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WebsiteCubit cubit(context) => BlocProvider.of(context);
          return Portal(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
                theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
                darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
              themeMode:cubit(context).isDark?ThemeMode.dark:ThemeMode.light ,
              home: const Home()
            ),
          );
        },
      ),
    );
  }
}
