import 'package:flutter/material.dart';
import 'package:galih_apps/page/curves/radialCircle.dart';
import 'childImage.dart';
import 'swipeText.dart';
import 'titleText.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double radiant = screenSize.height / 3.5 * 2;

    return SafeArea(
      child: Container(
        color: Color(0xeeF5F5F5),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: -screenSize.height / 4.5,
              right: -screenSize.width / 2.5,
              child: RadialCircle(radiant: radiant),
            ),
            ChildImage(),
            TitleText(),
            SwipeText(screenSize: screenSize)
          ],
        ),
      ),
    );
  }
}
