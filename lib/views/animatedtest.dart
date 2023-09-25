import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  @override






  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.
    final Uri toLaunch =
    Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // launchInBrowser(toLaunch);
        //
        },

                child: const Text('Launch in browser'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
