import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationDecelerate.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationEase.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationEaseIn.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationLinear.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationParty1.dart';
import 'package:flutter_layout_ledger/ui/listitem/ListItem1.dart';
import 'package:flutter_layout_ledger/ui/listitem/ListItem2.dart';
import 'package:flutter_layout_ledger/ui/listitem/BottomNavigationBar1.dart';

class ViewType {
  static const String VT_LIST_ITEM_ICON_TITLE_SUBTITLE =
      "list item: icon + title + subtitle";

  static const String VT_LIST_ITEM_TITLE_SUBTITLE_ICON =
      "list item: title + subtitle + icon";

  static const String VT_BOTTOM_NAVIGATION_BAR = "bottom navigation bar";
  static const String VT_ANIMATION_LINEAR = "animation linear";
  static const String VT_ANIMATION_DECELERATE = "animation decelerate";
  static const String VT_ANIMATION_EASE = "animation ease";
  static const String VT_ANIMATION_EASEIN = "animation easeIn";
  static const String VT_ANIMATION_PARTY_1 = "animation party 1";

  final String type;

  ViewType(this.type);

  static final List<String> _list = [
    VT_LIST_ITEM_ICON_TITLE_SUBTITLE,
    VT_LIST_ITEM_TITLE_SUBTITLE_ICON,
    VT_BOTTOM_NAVIGATION_BAR,
    VT_ANIMATION_PARTY_1,
    VT_ANIMATION_LINEAR,
    VT_ANIMATION_DECELERATE,
    VT_ANIMATION_EASE,
    VT_ANIMATION_EASEIN,
  ];

  static List<ViewType> fetchList() {
    List<ViewType> rtn = List();

    _list.forEach((element) => rtn.add(ViewType(element)));

    return rtn;
  }

  static void launcher(BuildContext context, String type) {
    switch (type) {
      case ViewType.VT_LIST_ITEM_ICON_TITLE_SUBTITLE:
        ListItem1.launcher(context);
        break;

      case ViewType.VT_LIST_ITEM_TITLE_SUBTITLE_ICON:
        ListItem2.launcher(context);
        break;

      case ViewType.VT_ANIMATION_LINEAR:
        AnimationLinear.launcher(context);
        break;

      case ViewType.VT_ANIMATION_DECELERATE:
        AnimationDecelerate.launcher(context);
        break;

      case ViewType.VT_ANIMATION_EASE:
        AnimationEase.launcher(context);
        break;

      case ViewType.VT_ANIMATION_EASEIN:
        AnimationEaseIn.launcher(context);
        break;

      case ViewType.VT_ANIMATION_PARTY_1:
        AnimationParty1.launcher(context);
        break;

      case ViewType.VT_BOTTOM_NAVIGATION_BAR:
        BottomNavigationBar1.launcher(context);
        break;
    }
  }
}
