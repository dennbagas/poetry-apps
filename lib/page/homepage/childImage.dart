import 'package:flutter/material.dart';

class ChildImage extends StatefulWidget {
  const ChildImage({
    Key key,
  }) : super(key: key);

  @override
  _ChildImageState createState() => _ChildImageState();
}

class _ChildImageState extends State<ChildImage> with TickerProviderStateMixin {
  AnimationController imageAnimationController;
  Animation<double> imageAnimation;

  initState() {
    imageAnimationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    imageAnimation = CurvedAnimation(parent: imageAnimationController, curve: Curves.easeInQuint);

    imageAnimationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    imageAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    return Positioned(
      bottom: MediaQuery.of(context).size.height / 10,
      left: MediaQuery.of(context).size.width / 50,
      height: screenWidth / 1.5,
      child: FadeTransition(
        opacity: imageAnimation,
        child: Image.asset('lib/assets/img/anak-smp.jpg'),
      ),
    );
  }
}
