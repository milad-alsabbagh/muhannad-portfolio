import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart';
import 'package:muhannadwebsite/models_lists/links_list.dart';
import 'package:muhannadwebsite/shared/Widgets/animated_widgets/animated_links_container.dart';
import 'package:muhannadwebsite/shared/Widgets/static_widgets/my_AppBar.dart';
import 'package:muhannadwebsite/shared/constants.dart';
import 'package:muhannadwebsite/shared/shared_variables.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key, required this.markDownData});
  final String markDownData;
  static String id = 'blogDetail';
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: currentWidth > 600
          ? const DesktopAppBar(
              isHome: false,
              currentPage: PageNames.blog,
            )
          : const MobileAppBar(
              isHome: false,
              currentPage: PageNames.blog,
            ),
      body: Stack(
        children: [
          Center(
            child: Markdown(
              styleSheet: MarkdownStyleSheet(
                h1: const TextStyle(color: Colors.green),
                h2: const TextStyle(color: Colors.red),
                h6: const TextStyle(color: Colors.blue),
              ),
              data: markDownData,
              onTapLink: (text, href, title) =>
                  (href != null ? launchUrl(Uri.parse(href)) : null),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: currentWidth / 2 -
                ((40 +
                        ((linksList.length - 1) * 10) +
                        (linksList.length * 34)) /
                    2),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AnimatedLinksContainer(direction: Direction.horizontal),
            ),
          ),
        ],
      ),
    );
  }
}
