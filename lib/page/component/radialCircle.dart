import 'dart:async';
import 'package:flutter/material.dart';

class RadialCircle extends StatefulWidget {
  const RadialCircle({
    Key key,
    @required this.radiant,
    this.startDuration = 2000,
    this.animationInterval = 5000,
    this.outerColor = const Color(0xFFB5E1F9),
    this.innerColor = const Color(0xFF4FB6F0),
  }) : super(key: key);

  final double radiant;
  final int startDuration;
  final int animationInterval;
  final Color outerColor;
  final Color innerColor;

  @override
  _RadialCircleState createState() => _RadialCircleState();
}

class _RadialCircleState extends State<RadialCircle> with TickerProviderStateMixin {
  AnimationController bounceAnimationController, startAnimationController;
  Animation<double> bounceAnimation;

  Timer timer;
  double _radiant;

  @override
  void initState() {
    _radiant = widget.radiant;

    startAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.startDuration),
    )..addListener(() {
        setState(() {});
      });

    bounceAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });

    bounceAnimation = Tween<double>(
      begin: 100.0,
      end: _radiant,
    ).animate(startAnimationController);

    bounceAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bounceAnimationController.animateTo(0, curve: Curves.bounceOut);
      }
    });

    timer = Timer.periodic(Duration(milliseconds: widget.animationInterval), (Timer t) {
      bounceAnimationController.animateTo(1, curve: Curves.easeInOutQuint);
    });

    startAnimationController.animateTo(1, curve: Curves.easeInOutQuart).whenComplete(() {
      bounceAnimation = Tween<double>(
        begin: _radiant,
        end: _radiant + 15,
      ).animate(bounceAnimationController);
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    startAnimationController.dispose();
    bounceAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius _borderRadius = BorderRadius.all(Radius.circular(_radiant / 2 + 100));

    return GestureDetector(
      onTap: () {
        bounceAnimationController.animateTo(1, curve: Curves.easeInOutQuint);
      },
      child: Container(
        width: bounceAnimation.value + 100,
        height: bounceAnimation.value + 100,
        decoration: BoxDecoration(
          color: widget.outerColor,
          borderRadius: _borderRadius,
        ),
        child: Center(
          child: Container(
            width: bounceAnimation.value,
            height: bounceAnimation.value,
            decoration: BoxDecoration(
              color: widget.innerColor,
              borderRadius: _borderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
