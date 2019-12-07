import 'package:flutter/material.dart';
import 'package:galih_apps/page/curves/radialCircle.dart';
import 'package:galih_apps/page/pengertianPuisi/const.dart';

class PengertianPuisi extends StatefulWidget {
  @override
  _PengertianPuisiState createState() => _PengertianPuisiState();
}

class _PengertianPuisiState extends State<PengertianPuisi> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    double heading1 = screenWidth / 10;
    double paragraph = screenWidth / 24;

    double radiant = screenHeight / 3.5 * 2;

    return SafeArea(
      child: Container(
        color: Color(0xeeF5F5F5),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: -screenHeight / 3,
              right: screenWidth / 2.65 - radiant / 2,
              child: RadialCircle(
                radiant: radiant,
                startDuration: 700,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 12, vertical: screenHeight / 8),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenWidth / 16,
                    screenHeight / 10,
                    screenWidth / 16,
                    screenHeight / 16,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Pengertian Puisi',
                        style: TextStyle(fontSize: heading1),
                      ),
                      // SizedBox(height: 20.0),
                      Divider(height: 80.0, thickness: 2.0, indent: 16.0, endIndent: 16.0),
                      // SizedBox(height: 20.0),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: pengertianPuisi,
                          style: TextStyle(color: Colors.black, fontSize: paragraph),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
