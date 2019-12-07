import 'package:flutter/material.dart';
import 'package:galih_apps/page/curves/radialCircle.dart';
import 'package:galih_apps/page/homepage/swipeText.dart';

class UnsurPuisi extends StatefulWidget {
  @override
  _UnsurPuisiState createState() => _UnsurPuisiState();
}

class _UnsurPuisiState extends State<UnsurPuisi> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    double heading = screenWidth / 14;

    double radiant = screenHeight / 3.5 * 2;

    return SafeArea(
      child: Container(
        color: Color(0xeeF5F5F5),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -screenHeight / 4,
              right: screenWidth / 3,
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
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 12, vertical: screenHeight / 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth / 12, vertical: screenWidth / 14),
                      child:
                          Text('Unsur-unsur Puisi', textAlign: TextAlign.center, style: TextStyle(fontSize: heading)),
                    ),
                  ),
                  UnsurPuisiCard(
                    text: 'Struktur batin',
                    subtext: 'Disebut sebagai hakikat suatu puisi',
                    callbackAction: () {},
                  ),
                  UnsurPuisiCard(
                    text: 'Struktur fisik',
                    subtext: 'Adalah metode penyampaian hakikat suatu puisi',
                    callbackAction: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: screenSize.height / 18,
              right: screenSize.width / 9,
              child: SwipeText(
                screenSize: screenSize,
                showUpDuration: 5000,
                text: '>>>',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UnsurPuisiCard extends StatelessWidget {
  const UnsurPuisiCard({
    Key key,
    @required this.text,
    @required this.subtext,
    @required this.callbackAction,
  }) : super(key: key);

  final String subtext;
  final String text;
  final Function callbackAction;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    double heading = screenWidth / 14;
    double paragraph = screenWidth / 24;

    return Card(
      child: Container(
        height: screenHeight / 3,
        padding: EdgeInsets.symmetric(horizontal: screenWidth / 12, vertical: screenWidth / 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: (screenHeight / 3) / 12),
            Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: heading - 4)),
            Divider(
                height: (screenHeight / 3) / 6, thickness: 2.0, indent: screenWidth / 16, endIndent: screenWidth / 16),
            Text(subtext, textAlign: TextAlign.center, style: TextStyle(fontSize: paragraph)),
            SizedBox(height: (screenHeight / 3) / 10),
            FlatButton.icon(
              icon: Icon(Icons.arrow_forward),
              label: Text('Lebih lanjut...', textAlign: TextAlign.center, style: TextStyle(fontSize: paragraph)),
              onPressed: callbackAction,
            )
          ],
        ),
      ),
    );
  }
}
