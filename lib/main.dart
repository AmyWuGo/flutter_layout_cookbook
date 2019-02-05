import 'package:flutter/material.dart';
import 'package:flutter_layout_ledger/model/ViewType.dart';
import 'package:flutter_layout_ledger/ui/MyListView.dart';

void main() {
  runApp(MyListView(ViewType.fetchCategoryList(), ViewType.CT_CATEGORY_LIST));
}
