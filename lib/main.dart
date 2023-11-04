// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:muhannadwebsite/cubit/cubit.dart';
import 'package:muhannadwebsite/cubit/states.dart';
import 'package:muhannadwebsite/shared/material_theme.dart';
import 'package:muhannadwebsite/views/about_view.dart';
import 'package:muhannadwebsite/views/blog_details.dart';
import 'package:muhannadwebsite/views/blogs_view.dart';
import 'package:muhannadwebsite/views/desktop_view.dart';
import 'package:muhannadwebsite/views/faq.dart';
import 'package:muhannadwebsite/views/home_view.dart';
import 'package:muhannadwebsite/views/images_of_life_view.dart';
import 'package:muhannadwebsite/views/mobile_view.dart';

void main() async {
  WidgetsFlutterBinding;
  // await js.context.callMethod('require', ['pdfjs-dist/build/pdf']);
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
              routes: {
                Home.id: (context) => const Home(),
                AboutView.id: (context) => const AboutView(),
                BlogsView.id: (context) => const BlogsView(),
                DesktopView.id: (context) => const DesktopView(),
                Faq.id: (context) => const Faq(),
                ImagesOfLife.id: (context) => const ImagesOfLife(),
                MobileView.id: (context) => const MobileView(),
              },
              debugShowCheckedModeBanner: false,
              theme:
                  ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
              darkTheme:
                  ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
              themeMode:
                  cubit(context).isDark ? ThemeMode.dark : ThemeMode.light,
              initialRoute: Home.id,
            ),
          );
        },
      ),
    );
  }
}
