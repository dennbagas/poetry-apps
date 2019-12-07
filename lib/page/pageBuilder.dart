import 'package:flutter/material.dart';
import 'package:galih_apps/page/homepage/homeScreen.dart';
import 'package:galih_apps/page/pengertianPuisi/screen.dart';

class PageBuilder extends StatefulWidget {
  @override
  _PageBuilderState createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          StartScreen(),
          PengertianPuisi(),
        ],
      ),
    );
  }
}
