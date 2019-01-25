import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationIF.dart';
import 'package:flutter_layout_ledger/ui/parts/PartsHelper.dart';

class AnimationParty1 extends StatefulWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnimationParty1()),
    );
  }

  AnimationParty1({Key key}) : super(key: key);

  @override
  _AnimationParty1 createState() => _AnimationParty1();
}

class _AnimationParty1 extends State<AnimationParty1>
    with SingleTickerProviderStateMixin
    implements AnimationIF {
  AnimationController _iconAnimationController;
  List<CurvedAnimation> _animationList = List();

  static final List<Curve> _curveList = [
    Curves.decelerate,
    Curves.ease,
    Curves.easeIn,
    Curves.easeOut,
    Curves.easeInOut,
    Curves.fastOutSlowIn,
    Curves.fastOutSlowIn,
    Curves.bounceIn,
    Curves.bounceOut,
    Curves.bounceInOut,
    Curves.elasticIn,
    Curves.elasticOut,
    Curves.elasticInOut,
    Curves.bounceIn,
    Curves.bounceOut,
    Curves.bounceInOut,
  ];
  static final List<Color> _colorList = [
    Colors.yellow,
    Colors.pink,
    Colors.blue,
    Colors.orangeAccent,
    Colors.green,
    Colors.limeAccent,
    Colors.blueGrey,
    Colors.amber,
    Colors.red,
    Colors.teal[600],
    Colors.blue[300],
    Colors.pink[300],
    Colors.green[300],
    Colors.blueGrey[400],
    Colors.amber[900],
    Colors.yellow[900],
  ];

  final myRandom = Random();

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(
        vsync: this,
        upperBound: 1.0,
        duration: new Duration(milliseconds: 5000));

    makeAnimationMembers();
  }

  void makeAnimationMembers() {
    _curveList.forEach((curve) => addMember(curve));
  }

  void addMember(Curve myCurve) {
    var animation =
        new CurvedAnimation(parent: _iconAnimationController, curve: myCurve);
    animation.addListener(() => this.setState(() {}));
    _animationList.add(animation);
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
        title: Text(ViewType.VT_ANIMATION_PARTY_1),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(children: _fetchTargets());
  }

  void _startAnimation() {
    _iconAnimationController.reset();
    _iconAnimationController.forward();
  }

  @override
  void startAnimation() {
    _startAnimation();
  }

  List<Widget> _fetchTargets() {
    List<Widget> rtn = List();
    final int percent = (_iconAnimationController.value * 100.0).round();
    rtn.add(PartsHelper.fetchStartAnimationIcon(percent, this));

    for (int i = 0; i < _animationList.length; i++) {
      rtn.add(PartsHelper.fetchTargetIcon(
          (_animationList[i].value * 100.0).round(),
          myColor: _colorList[i]));
    }

    return rtn;
  }
}
