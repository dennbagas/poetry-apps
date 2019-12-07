import 'package:flutter/material.dart';
import 'package:galih_apps/page/contohPuisi/contohPuisi.dart';
import 'package:galih_apps/page/jenisPuisi/jenisPuisiScreen.dart';
import 'package:galih_apps/page/unsurPuisi/startScreen.dart';
import 'homepage/homeScreen.dart';
import 'pengertianPuisi/screen.dart';

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
          UnsurPuisi(),
          JenisPuisi(),
          ContohPuisi(),
        ],
      ),
    );
  }
}
