import 'dart:async';
import 'package:flutter/material.dart';

class SwipeText extends StatefulWidget {
  const SwipeText({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _SwipeTextState createState() => _SwipeTextState();
}

class _SwipeTextState extends State<SwipeText> with TickerProviderStateMixin {
  AnimationController swipeAnimationController;
  Animation<double> swipeAnimation;

  Timer _timer;

  initState() {
    swipeAnimationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    swipeAnimation = CurvedAnimation(parent: swipeAnimationController, curve: Curves.easeIn);

    swipeAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        swipeAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        swipeAnimationController.forward();
      }
    });

    _timer = Timer(Duration(milliseconds: 4000), () {
      swipeAnimationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    swipeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.screenSize.height / 10,
      right: widget.screenSize.width / 10,
      child: FadeTransition(
        opacity: swipeAnimation,
        child: Text('Swipe Left >>>', style: TextStyle(fontSize: 18.0)),
      ),
    );
  }
}
