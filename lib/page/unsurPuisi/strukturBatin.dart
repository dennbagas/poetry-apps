import 'package:flutter/material.dart';
import 'package:galih_apps/page/component/dialogCard.dart';
import 'package:galih_apps/page/component/radialCircle.dart';
import 'package:galih_apps/page/unsurPuisi/constant.dart';

class StrukturBatin extends StatefulWidget {
  @override
  _StrukturBatinState createState() => _StrukturBatinState();
}

class _StrukturBatinState extends State<StrukturBatin> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    double heading = screenWidth / 14;
    double radiant = screenHeight / 3.5 * 2;

    return SafeArea(
      child: Container(
        color: Color(0xeeF7F7F7),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -screenHeight / 3,
              left: screenWidth / 4,
              child: RadialCircle(
                radiant: radiant,
                startDuration: 700,
              ),
            ),
            Positioned(
              bottom: -screenHeight / 4,
              left: screenWidth / 2,
              child: RadialCircle(
                radiant: radiant / 2,
                startDuration: 1000,
                animationInterval: 5200,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 12, vertical: screenHeight / 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth / 14, vertical: screenWidth / 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: heading),
                          Text('Struktur Batin', textAlign: TextAlign.center, style: TextStyle(fontSize: heading - 4)),
                        ],
                      ),
                    ),
                  ),

                  // loop into content
                  for (var i in strukturBatiniah) DialogCard(dialogText: i.subtitle, text: i.title)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
