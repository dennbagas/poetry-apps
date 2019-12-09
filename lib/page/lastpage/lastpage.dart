import 'package:flutter/material.dart';
import 'package:galih_apps/page/contohPuisi/constant.dart';
import 'package:galih_apps/page/component/radialCircle.dart';
import 'package:nima/nima_actor.dart';

class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    double heading = screenWidth / 10;
    double radiant = screenHeight / 3.5 * 2;

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: -screenWidth / 3,
              child: RadialCircle(
                radiant: radiant / 2,
                startDuration: 1000,
                animationInterval: 6000,
              ),
            ),
            Positioned(
              bottom: -screenHeight / 3,
              right: screenWidth / 2.65 - radiant / 2,
              child: RadialCircle(
                radiant: radiant,
                startDuration: 700,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                margin: EdgeInsets.only(top: screenWidth / 3),
                child: Container(
                  constraints: BoxConstraints.tight(Size(screenWidth / 1.2, screenHeight / 3)),
                  child: Center(
                    child: Text(
                      'Ayo Belajar Membuat Puisi Dengan Tema Pendidikan!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: heading,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: screenWidth / 6,
              left: screenWidth / 4,
              right: screenWidth / 4,
              child: NimaActor(
                "lib/assets/anim/Newton.nima",
                alignment: Alignment.bottomCenter,
                fit: BoxFit.contain,
                animation: 'Idle',
              ),
            )
          ],
        ),
      ),
    );
  }
}
