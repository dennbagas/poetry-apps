import 'package:flutter/material.dart';
import 'package:galih_apps/page/pageBuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Puisi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageBuilder(),
    );
  }
}
