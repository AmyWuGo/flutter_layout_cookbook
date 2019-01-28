
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';

class AnimationTransformation extends StatefulWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnimationTransformation()),
    );
  }

  AnimationTransformation({Key key}) : super(key: key);

  @override
  _AnimationTransformation createState() => _AnimationTransformation();
}

class _AnimationTransformation extends State<AnimationTransformation>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;

  Animation<BorderRadius> borderRadius;

  Animation<double> transitionTween;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this,
        upperBound: 1.0,
        duration: new Duration(milliseconds: 2000));

    transitionTween = Tween<double>(
      begin: 50.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(75.0),
      end: BorderRadius.circular(4.0),
    ).animate(
      CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.ease,
      ),
    );
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ViewType.VT_ANIMATION_TRANSFORMATION),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return AnimatedBuilder(
      animation: _iconAnimationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
              child: Container(
            width: transitionTween.value,
            height: transitionTween.value,
            decoration: BoxDecoration(
                borderRadius: borderRadius.value,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage('assets/ninja.png'),
                )),
          )),
        );
      },
    );
  }
}
