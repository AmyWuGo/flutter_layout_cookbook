import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';

class ViewScaleTransition extends StatefulWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewScaleTransition()),
    );
  }

  ViewScaleTransition({Key key}) : super(key: key);

  @override
  _ViewScaleTransition createState() => _ViewScaleTransition();
}

class _ViewScaleTransition extends State<ViewScaleTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  CurvedAnimation _iconAnimation;
  final myRandom = Random();
  double width;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this,
        upperBound: 1.0,
        duration: new Duration(milliseconds: 2000));

    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController,
        curve:  Curves.elasticInOut);
//        curve: new Interval(0.01, 1.0, curve: Curves.bounceInOut));
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimation.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        _iconAnimationController.reverse();
      }
    });
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
        title: Text(ViewType.VT_ANIMATION_SCALE_TRANSITION),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final int percent = (_iconAnimationController.value * 100.0).round();
    width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        _getStartAnimationBtn(percent),
        _getTargetIcon(percent)
      ],
    );
  }

  Widget _getTargetIcon(int percent) {
    return Align(
        alignment: Alignment.center,
        child: ScaleTransition(
          scale: _iconAnimation,
          child: Container(
            height: width,
            width: width,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          ),
        ));
  }

  void _startAnimation() {
    _iconAnimationController.reset();
    _iconAnimationController.forward();
  }

  Widget _getStartAnimationBtn(int percent) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          _startAnimation();
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 50.0),
          padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
          child: Text('$percent%'),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.yellow,
            borderRadius: new BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
