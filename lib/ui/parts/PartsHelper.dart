import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationIF.dart';

class PartsHelper {
  static Positioned fetchTargetIcon(int percent, {Color myColor: Colors.green}) {
    return Positioned(
      top: percent + 20.0,
      left: percent + 20.0,
      child: Container(
        height: 24.0,
        width: 24.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: myColor),
      ),
    );
  }

  static Widget fetchStartAnimationIcon(int percent, AnimationIF callback) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          callback.startAnimation();
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
