import 'package:flutter/material.dart';
import 'package:galih_apps/page/component/radialCircle.dart';
import 'package:galih_apps/page/homepage/swipeText.dart';
import 'package:galih_apps/page/jenisPuisi/puisiBaru.dart';
import 'package:galih_apps/page/jenisPuisi/puisiKontemporer.dart';
import 'package:galih_apps/page/jenisPuisi/puisiLama.dart';

class JenisPuisi extends StatefulWidget {
  @override
  _JenisPuisiState createState() => _JenisPuisiState();
}

class _JenisPuisiState extends State<JenisPuisi> {
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
              top: 0.0,
              left: screenWidth / 2.5,
              child: RadialCircle(
                radiant: radiant / 2,
                startDuration: 700,
              ),
            ),
            Positioned(
              bottom: -screenHeight / 6,
              right: screenWidth / 2,
              child: RadialCircle(
                radiant: radiant / 1.5,
                startDuration: 1000,
                animationInterval: 5200,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth / 12, vertical: screenHeight / 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Card(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth / 12, vertical: screenWidth / 16),
                            child: Text(
                              'Jenis – jenis puisi',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: heading),
                            ),
                          ),
                        ),
                        JenisPuisiCard(
                          text: 'Puisi lama',
                          subtext:
                              'Puisi yang masih terikat oleh berbagai aturan seperti: jumlah kata dalam baris puisi. Puisi ini bercirikan khas melayu dan lahir sebelum penjajahan Belanda',
                          callbackAction: () =>
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PuisiLama())),
                        ),
                        JenisPuisiCard(
                          text: 'Puisi baru',
                          subtext:
                              'Puisi yang lebih bebas, baik dari segi bait, segi kata, maupun rima. Puisi baru lebih terpengaruh dengan khas gaya bahasa eropa',
                          callbackAction: () =>
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PuisiBaru())),
                        ),
                        JenisPuisiCard(
                          text: 'Puisi kontemporer',
                          subtext: 'Jenis puisi yang berusaha keluar dari ikatan konvensional dari puisi itu sendiri.',
                          callbackAction: () =>
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PuisiKontemporer())),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    SwipeText(
                      screenSize: screenSize,
                      showUpDuration: 5000,
                      text: '>>>',
                    )
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

class JenisPuisiCard extends StatelessWidget {
  const JenisPuisiCard({
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
        height: screenHeight / 4.1,
        padding: EdgeInsets.symmetric(horizontal: screenWidth / 12, vertical: screenWidth / 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: heading - 6)),
            Divider(
                height: (screenHeight / 10) / 8, thickness: 2.0, indent: screenWidth / 16, endIndent: screenWidth / 16),
            Text(subtext, textAlign: TextAlign.center, style: TextStyle(fontSize: paragraph - 4)),
            FlatButton.icon(
              icon: Icon(Icons.arrow_forward),
              label: Text('Lebih lanjut...', textAlign: TextAlign.center, style: TextStyle(fontSize: paragraph - 2)),
              onPressed: callbackAction,
            )
          ],
        ),
      ),
    );
  }
}
