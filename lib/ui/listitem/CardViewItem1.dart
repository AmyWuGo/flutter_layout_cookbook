import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';

class CardViewItem1 extends StatelessWidget {
//bottom navigation bar

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
        itemCount: 100,
        itemBuilder: (context, position) {
          return _getCardItem(position: position);
        },
      ),
    );
  }

  _getCardItem({int position = 0}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(position.toString(), style: TextStyle(fontSize: 22.0),),
      ),
    )
  }
}
