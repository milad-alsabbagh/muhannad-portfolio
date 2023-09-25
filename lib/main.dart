import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/share_preferences/cache_helper.dart';
import 'package:muhannadwebsite/shared/shared_enums.dart';
import 'package:muhannadwebsite/shared/themes.dart';
import 'package:muhannadwebsite/views/animatedtest.dart';
import 'package:muhannadwebsite/views/home_view.dart';

void main() async {
  await CacheHelper.init();
  var isDark = CacheHelper.getIsDarkMode(key: sharedEnum.isDark.toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return WebsiteCubit();
      },
      child: BlocConsumer<WebsiteCubit, WebsiteStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WebsiteCubit cubit(context) => BlocProvider.of(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode:cubit(context).isDark?ThemeMode.dark:ThemeMode.light ,
            home: Home(),
          );
        },
      ),
    );
  }
}
