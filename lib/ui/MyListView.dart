import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';
import 'package:flutter_layout_ledger/util/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyListView extends StatelessWidget {
  static Future launcher(
      BuildContext context, List<ViewType> viewList, String viewTitle) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyListView(viewList, viewTitle)),
    );
  }

  final List<ViewType> viewList;
  final String viewTitle;

  const MyListView(this.viewList, this.viewTitle, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (viewTitle == ViewType.CT_CATEGORY_LIST) {
      return makeWidgetWithTheme(context);
    }

    return makeWidget(context);
  }

  ListView makeBody() {
    return ListView.builder(
      addRepaintBoundaries: true,
      itemBuilder: (BuildContext context, int index) =>
          _EntryItem(viewList[index]),
      itemCount: viewList.length,
    );
  }

  Widget makeWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewTitle),
      ),
      body: makeBody(),
    );
  }

  Widget makeWidgetWithTheme(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('zh', 'CN'), // Simplified Chinese
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.light,
        primaryColor: Color(0xFF1CA48E),
        primaryColorDark: Color(0xFF1CA48E),
        accentColor: Color(0xFF1CA48E),

//        fontFamily: 'Montserrat',

        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(viewTitle),
        ),
        body: makeBody(),
      ),
    );
  }
}

class _EntryItem extends StatelessWidget {
  const _EntryItem(this.entry);

  final ViewType entry;

  Widget _buildTiles(ViewType root, BuildContext context) {
    return GestureDetector(
      onTap: () {
        ViewType.launcher(context, root.type);
      },
      child: ListTile(title: Text(entry.type)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry, context);
  }
}
