import 'package:flutter/material.dart';

class DialogCard extends StatelessWidget {
  const DialogCard({
    Key key,
    @required this.text,
    @required this.dialogText,
  }) : super(key: key);

  final String text, dialogText;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double heading = screenWidth / 14;
    double paragraph = screenWidth / 24;

    return Card(
      elevation: 8.0,
      child: InkWell(
        onTap: () {
          showGeneralDialog(
              barrierColor: Colors.black.withOpacity(0.5),
              transitionBuilder: (context, a1, a2, widget) {
                return Transform.scale(
                  scale: a1.value,
                  child: Opacity(
                    opacity: a1.value,
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      ),
                      title: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: heading - 6),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Divider(),
                          Text(
                            dialogText,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: paragraph + 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              transitionDuration: Duration(milliseconds: 200),
              barrierDismissible: true,
              barrierLabel: '',
              context: context,
              pageBuilder: (context, animation1, animation2) {});
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth / 14, vertical: screenWidth / 18),
          child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: heading - 8)),
        ),
      ),
    );
  }
}
