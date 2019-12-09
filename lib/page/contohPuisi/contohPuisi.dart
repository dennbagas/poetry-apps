import 'package:flutter/material.dart';
import 'package:galih_apps/page/contohPuisi/constant.dart';
import 'package:galih_apps/page/component/radialCircle.dart';

class ContohPuisi extends StatefulWidget {
  @override
  _ContohPuisiState createState() => _ContohPuisiState();
}

class _ContohPuisiState extends State<ContohPuisi> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    double paragraph = screenWidth / 24;
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 14, vertical: screenHeight / 12),
              child: Card(
                elevation: 8.0,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth / 20,
                      screenHeight / 40,
                      screenWidth / 20,
                      screenHeight / 40,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'contoh puisi pendidikan',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: paragraph - 2,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'Jangan Malas Membaca',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: paragraph + 4,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Karya : Abdul Jalil',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: paragraph,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            contohPuisi,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: paragraph,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
