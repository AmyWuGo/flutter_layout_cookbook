import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';

class AnimationLinear extends StatelessWidget {
//list item: icon + title + subtitle

  static Future launcher(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnimationLinear()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ViewType.VT_LIST_ITEM_TITLE_SUBTITLE_ICON),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext content, int index) {
            return buildBody(content);
          }),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(6.0, 12.0, 12.0, 8.0),
      child: ListTile(
        title: Text(
            "Item Item Item Item Item Item Item Item Item Item Item Item "),
        subtitle: Text(
          "Item subtitlw Item subtitlw Item subtitlw Item subtitlw Item subtitlw Item subtitlw Item subtitlw Item subtitlw Item subtitlw Item subtitlw Item subtitlw Item subtitlw ",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: CircleAvatar(
          child: Text("A", style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Color(0xFF1CA48E),
          foregroundColor: Color(0xFFFFFFFF),
        ),
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: const Color(0xffcecece), width: 0.5))),
    );
  }
}
