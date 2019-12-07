import 'dart:async';
import 'package:flutter/material.dart';

class TitleText extends StatefulWidget {
  const TitleText({
    Key key,
  }) : super(key: key);

  @override
  _TitleTextState createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> with TickerProviderStateMixin {
  AnimationController titleAnimationController;
  Animation<double> titleAnimation;
  double _marginTop;

  Timer _timer;

  initState() {
    titleAnimationController = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    titleAnimation = CurvedAnimation(parent: titleAnimationController, curve: Curves.easeInQuint);

    _marginTop = 40.0;

    _timer = Timer(Duration(milliseconds: 600), () {
      titleAnimationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    titleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _timer = Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _marginTop = 0.0;
      });
    });

    Curve _curves = Curves.easeOutQuart;
    Duration _duration = Duration(milliseconds: 1500);

    return Positioned(
      top: MediaQuery.of(context).size.height / 6,
      right: MediaQuery.of(context).size.width / 14,
      child: AnimatedContainer(
        duration: _duration,
        curve: _curves,
        margin: EdgeInsets.only(top: _marginTop),
        child: FadeTransition(
          opacity: titleAnimation,
          child: Text(
            'AYO BELAJAR\nMEMBUAT PUISI',
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                  color: Color.fromARGB(200, 220, 220, 220),
                )
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
