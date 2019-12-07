import 'package:flutter/material.dart';
import 'package:galih_apps/page/pageBuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Puisi',
      home: PageBuilder(),
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.blue,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
        ),
      ),
    );
  }
}
