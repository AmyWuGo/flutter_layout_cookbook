import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';

class FutureWaitClass extends StatelessWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FutureWaitClass()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ViewType.VT_FUTURE_WAIT),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return InkWell(
      onTap: _tryIsolate(),
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(8.0),
          shape: BoxShape.rectangle,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  _tryIsolate() {
    Future.wait([_FutureClass.echo1(), _FutureClass.echo2()]);

    print("Finished waitting.");
  }
}

class _FutureClass {
  static Future echo1() async {
    for (int index = 0; index < 100; index++) {
      print("echo1 + $index");
    }
  }

  static Future echo2() async {
    for (int index = 0; index < 100; index++) {
      print("echo2 + $index");
    }
  }
}
