import 'package:flutter/material.dart';
import 'package:galih_apps/page/component/radialCircle.dart';
import 'childImage.dart';
import 'swipeText.dart';
import 'titleText.dart';

class StartScreen extends StatefulWidget {
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
        color: Colors.white,
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
            Positioned(
              bottom: screenSize.height / 10,
              right: screenSize.width / 10,
              child: SwipeText(screenSize: screenSize, text: '>>>'),
            )
          ],
        ),
      ),
    );
  }
}
