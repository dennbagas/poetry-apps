import 'package:flutter/material.dart';
import 'package:galih_apps/page/component/radialCircle.dart';
import 'package:galih_apps/page/homepage/swipeText.dart';

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

    double heading = screenWidth / 10;
    double paragraph = screenWidth / 24;

    double radiant = screenHeight / 3.5 * 2;

    const pengertianPuisi =
        'Puisi adalah karya sastra tertulis dimana isinya merupakan ungkapan perasaan seorang penyair dengan menggunakan bahasa yang bermakna semantis serta mengandung irama, rima, dan ritma dalam penyusunan larik dan baitnya.';

    return SafeArea(
      child: Container(
        color: Colors.white,
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
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth / 12, vertical: screenHeight / 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Card(
                      elevation: 8.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          screenWidth / 16,
                          screenHeight / 10,
                          screenWidth / 16,
                          screenHeight / 20,
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Pengertian Puisi',
                              style: TextStyle(fontSize: heading - 2),
                            ),
                            // SizedBox(height: 20.0),
                            Divider(
                                height: 80.0, thickness: 2.0, indent: screenWidth / 16, endIndent: screenWidth / 16),
                            // SizedBox(height: 20.0),
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text: pengertianPuisi,
                                style: TextStyle(color: Colors.black, fontSize: paragraph, height: 2.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    SwipeText(
                      screenSize: screenSize,
                      showUpDuration: 5000,
                      text: '>>>',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
