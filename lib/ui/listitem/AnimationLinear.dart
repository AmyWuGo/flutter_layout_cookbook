import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';

class AnimationLinear extends StatefulWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnimationLinear()),
    );
  }

  AnimationLinear({Key key}) : super(key: key);

  @override
  _AnimationLinear createState() => _AnimationLinear();
}

class _AnimationLinear extends State<AnimationLinear>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  CurvedAnimation _iconAnimation;
  final myRandom = Random();

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this,
        upperBound: 2.0,
        duration: new Duration(milliseconds: 1000));

//    _iconAnimation = new CurvedAnimation(
//        parent: _iconAnimationController, curve: Curves.easeInOut);
    _iconAnimationController.addListener(() => this.setState(() {}));
//    _iconAnimationController.forward();
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
        title: Text(ViewType.VT_ANIMATION_LINEAR),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final int percent = (_iconAnimationController.value * 100.0).round();

    return Stack(
      children: <Widget>[
        _getStartAnimationBtn(percent),
        _getTargetIcon(percent)
      ],
    );
  }

  Positioned _getTargetIcon(int percent) {
    return Positioned(
      top: percent + 20.0,
      left: percent + 20.0,
      child: Container(
        height: 28.0,
        width: 28.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
      ),
    );
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
