import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';

class SpinningSquare extends StatefulWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SpinningSquare()),
    );
  }

  SpinningSquare({Key key}) : super(key: key);

  @override
  _SpinningSquare createState() => _SpinningSquare();
}

class _SpinningSquare extends State<SpinningSquare>
    with SingleTickerProviderStateMixin {
  AnimationController _animation;

  @override
  void initState() {
    super.initState();
    // We use 3600 milliseconds instead of 1800 milliseconds because 0.0 -> 1.0
    // represents an entire turn of the square whereas in the other examples
    // we used 0.0 -> math.pi, which is only half a turn.
    _animation = AnimationController(
      duration: const Duration(milliseconds: 3600),
      vsync: this,
    )
      ..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ViewType.VT_SPINNING_SQUARE),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return RotationTransition(
        turns: _animation,
        child: Center(
            child: Container(
          width: 200.0,
          height: 200.0,
          color: const Color(0xFF00FF00),
        )));
  }
}
