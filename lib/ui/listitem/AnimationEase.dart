import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationIF.dart';
import 'package:flutter_layout_ledger/ui/parts/PartsHelper.dart';

class AnimationEase extends StatefulWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnimationEase()),
    );
  }

  AnimationEase({Key key}) : super(key: key);

  @override
  _AnimationEase createState() => _AnimationEase();
}

class _AnimationEase extends State<AnimationEase>
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
        parent: _iconAnimationController, curve: Curves.ease);
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
        title: Text(ViewType.VT_ANIMATION_EASE),
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
