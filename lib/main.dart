import 'package:flutter/material.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';
import 'package:flutter_layout_ledger/util/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlutterLayoutLedgerList extends StatelessWidget {
  var viewList = ViewType.fetchList();

  @override
  Widget build(BuildContext context) {
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
          title: const Text("Flutter Layout Ledger List"),
        ),
        body: makeBody(),
      ),
    );
  }

  //      title: AppLocalizations.of(context).translate['settings'],

  ListView makeBody() {
    return ListView.builder(
      addRepaintBoundaries: true,
      itemBuilder: (BuildContext context, int index) =>
          EntryItem(viewList[index]),
      itemCount: viewList.length,
    );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

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

void main() {
  runApp(FlutterLayoutLedgerList());
}
