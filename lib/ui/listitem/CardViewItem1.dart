import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';

class CardViewItem1 extends StatelessWidget {
  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CardViewItem1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ViewType.VT_CARD_VIEW_ITEM_1),
      ),
      body: MyCardViewItem1(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyCardViewItem1 extends StatefulWidget {
  MyCardViewItem1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyCardViewItem1> {
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
        onTap: () {
        },
        child: Container(
            margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(8.0),
                border: Border.all(color: const Color(0xff76C7F2), width: 3.0)),
            padding: const EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 16.0),
            child: _getChild(position)));
  }

  _getChild(int position) {
    return ListTile(
      title: Text(
          (position % 2 == 0? "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa":"bbb"),
          style: TextStyle(
              fontSize: 20.0,
              color: const Color(0xff625E5E),
              fontWeight: FontWeight.bold)),
      leading: _getNum(position),
    );
  }

  _getNum(int position) {
    return Container(
        alignment: Alignment.center,
        width: 62.0,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
            topLeft: new Radius.circular(4.0),
            topRight: new Radius.circular(24.0),
            bottomRight: new Radius.circular(16.0),
            bottomLeft: new Radius.circular(24.0),
          ),
          color: const Color(0xff58B7EA),
        ),
        child: Text(position.toString(),
            style: TextStyle(
                fontSize: 20.0,
                color: const Color(0xffF7F7F7),
                fontWeight: FontWeight.bold)));
  }
}
