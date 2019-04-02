import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';

class WorldClock extends StatelessWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WorldClock()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ViewType.VT_CARD_VIEW_ITEM_1),
      ),
      body: MyWorldClock(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyWorldClock extends StatefulWidget {
  MyWorldClock({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyWorldClock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 102,
        itemBuilder: (context, position) {
          return _getCardItem(position: position);
        },
      ),
    );
  }

  _getCardItem({int position = 0}) {
    return InkWell(
        onTap: () {},
        child: Container(
            margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(8.0),
                border: Border.all(color: const Color(0xff58B7EA), width: 4.0)),
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
            child: _getChild(position)));
  }

  _getChild(int position) {
    return Column(
      children: [
        _getTitle(position),
        _getTime(),
      ],
    );
  }

  _getTitle(int position) {
    return ListTile(
      title: Text((position % 2 == 0 ? "TOKYO" : "CHINA"),
          maxLines: 1,
          style: TextStyle(
              fontSize: 32.0,
              color: const Color(0xff58B7EA),
              fontWeight: FontWeight.bold)),
      trailing: _getNum(position),
    );
  }

  _getTime() {
    return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),

        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 32.0),
        color: const Color(0xff58B7EA),


        child: Text("10:10",
            style: TextStyle(
                fontSize: 36.0,
                color: const Color(0xffF7F7F7),
                fontWeight: FontWeight.bold)));
  }

  _getNum(int position) {
    return Text(position.toString(),
        style: TextStyle(
            fontSize: 32.0,
            color: const Color(0xff58B7EA),
            fontWeight: FontWeight.bold));
  }
}
