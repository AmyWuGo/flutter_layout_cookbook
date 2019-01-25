import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationIF.dart';
import 'package:flutter_layout_ledger/ui/parts/PartsHelper.dart';

class AnimationEaseIn extends StatefulWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnimationEaseIn()),
    );
  }

  AnimationEaseIn({Key key}) : super(key: key);

  @override
  _AnimationEaseIn createState() => _AnimationEaseIn();
}

class _AnimationEaseIn extends State<AnimationEaseIn>
    with SingleTickerProviderStateMixin
    implements AnimationIF {
  AnimationController _iconAnimationController;
  CurvedAnimation _iconAnimation;
  final myRandom = Random();

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this,
        upperBound: 1.0,
        duration: new Duration(milliseconds: 5000));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));
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
        title: Text(ViewType.VT_ANIMATION_EASEIN),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final int percent = (_iconAnimation.value * 100.0).round();

    return Stack(
      children: <Widget>[
        PartsHelper.fetchStartAnimationIcon(percent, this),
        PartsHelper.fetchTargetIcon(percent)
      ],
    );
  }

  void _startAnimation() {
    _iconAnimationController.reset();
    _iconAnimationController.forward();
  }

  @override
  void startAnimation() {
    _startAnimation();
  }
}
