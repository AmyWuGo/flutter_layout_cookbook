import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_layout_ledger/ui/MyListView.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationDecelerate.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationEase.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationEaseIn.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationLinear.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationParty1.dart';
import 'package:flutter_layout_ledger/ui/listitem/AnimationTransformation.dart';
import 'package:flutter_layout_ledger/ui/listitem/CardViewItem1.dart';
import 'package:flutter_layout_ledger/ui/listitem/DismissibleDemo.dart';
import 'package:flutter_layout_ledger/ui/listitem/FutureWaitClass.dart';
import 'package:flutter_layout_ledger/ui/listitem/ListItem1.dart';
import 'package:flutter_layout_ledger/ui/listitem/ListItem2.dart';
import 'package:flutter_layout_ledger/ui/listitem/BottomNavigationBar1.dart';
import 'package:flutter_layout_ledger/ui/listitem/SpinningSquare.dart';
import 'package:flutter_layout_ledger/ui/listitem/ViewScaleTransition.dart';
import 'package:flutter_layout_ledger/ui/listitem/WorldClock.dart';

class ViewType {
  final String type;

  ViewType(this.type);

  static const String VT_LIST_ITEM_ICON_TITLE_SUBTITLE =
      "list item: icon + title + subtitle";

  static const String VT_LIST_ITEM_TITLE_SUBTITLE_ICON =
      "list item: title + subtitle + icon";

  static const String VT_BOTTOM_NAVIGATION_BAR = "bottom navigation bar";
  static const String VT_WORLD_CLOCK = "world time clock";
  static const String VT_CARD_VIEW_ITEM_1 = "card view item 1";
  static const String VT_ANIMATION_LINEAR = "animation linear";
  static const String VT_ANIMATION_DECELERATE = "animation decelerate";
  static const String VT_ANIMATION_EASE = "animation ease";
  static const String VT_ANIMATION_EASEIN = "animation easeIn";
  static const String VT_ANIMATION_PARTY_1 = "animation party 1";
  static const String VT_ANIMATION_SCALE_TRANSITION =
      "animation scale transition";
  static const String VT_ANIMATION_TRANSFORMATION = "animation transformation";
  static const String VT_FUTURE_WAIT = "future wait";
  static const String VT_DISMISSIBLE = "dismissible";
  static const String VT_SPINNING_SQUARE = "spinning square";

  static const String CT_FEATURE_LIST = "Feature List";
  static const String CT_WIDGET_LIST = "Widget List";
  static const String CT_ANIMATION_LIST = "Animation List";
  static const String CT_CATEGORY_LIST = "Flutter Ledger List";

  static final List<String> _categoryList = [
    CT_FEATURE_LIST,
    CT_WIDGET_LIST,
    CT_ANIMATION_LIST,
  ];

  static final List<String> _featureList = [
    VT_FUTURE_WAIT,
  ];

  static final List<String> _widgetList = [
    VT_LIST_ITEM_ICON_TITLE_SUBTITLE,
    VT_LIST_ITEM_TITLE_SUBTITLE_ICON,
    VT_BOTTOM_NAVIGATION_BAR,
    VT_CARD_VIEW_ITEM_1,
    VT_WORLD_CLOCK,
  ];

  static final List<String> _animationList = [
    VT_SPINNING_SQUARE,
    VT_DISMISSIBLE,
    VT_ANIMATION_SCALE_TRANSITION,
    VT_ANIMATION_TRANSFORMATION,
    VT_ANIMATION_PARTY_1,
    VT_ANIMATION_LINEAR,
    VT_ANIMATION_DECELERATE,
    VT_ANIMATION_EASE,
    VT_ANIMATION_EASEIN,
  ];

  static List<ViewType> fetchCategoryList() {
    List<ViewType> rtn = List();

    _categoryList.forEach((element) => rtn.add(ViewType(element)));

    return rtn;
  }

  static List<ViewType> _generateList(List<String> original) {
    List<ViewType> rtn = List();

    original.forEach((element) => rtn.add(ViewType(element)));

    return rtn;
  }

  static void launcher(BuildContext context, String type) {
    switch (type) {
      case ViewType.CT_FEATURE_LIST:
        MyListView.launcher(
            context, _generateList(_featureList), ViewType.CT_FEATURE_LIST);
        break;

      case ViewType.CT_WIDGET_LIST:
        MyListView.launcher(
            context, _generateList(_widgetList), ViewType.CT_WIDGET_LIST);
        break;

      case ViewType.CT_ANIMATION_LIST:
        MyListView.launcher(
            context, _generateList(_animationList), ViewType.CT_ANIMATION_LIST);
        break;

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

      case ViewType.VT_ANIMATION_SCALE_TRANSITION:
        ViewScaleTransition.launcher(context);
        break;

      case ViewType.VT_ANIMATION_TRANSFORMATION:
        AnimationTransformation.launcher(context);
        break;

      case ViewType.VT_BOTTOM_NAVIGATION_BAR:
        BottomNavigationBar1.launcher(context);
        break;

      case ViewType.VT_CARD_VIEW_ITEM_1:
        CardViewItem1.launcher(context);
        break;
      case ViewType.VT_WORLD_CLOCK:
        WorldClock.launcher(context);
        break;

      case ViewType.VT_FUTURE_WAIT:
        FutureWaitClass.launcher(context);
        break;

      case ViewType.VT_DISMISSIBLE:
        DismissibleDemo.launcher(context);
        break;

      case ViewType.VT_SPINNING_SQUARE:
        SpinningSquare.launcher(context);
        break;
    }
  }
}
