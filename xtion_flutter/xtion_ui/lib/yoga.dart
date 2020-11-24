
import 'package:flutter/material.dart';

//主轴方向
enum YogaFlexDirection {
  row,
  rowReverse,
  column,
  columnReverse
}

//主轴方向上的剩余空间应该如何利用
enum YogaJustifyContent {
  start,
  center,
  end,
  spaceBetween,
  spaceAround,
  spaceEvenly
}

//交叉轴方向上的剩余空间应该如何利用
enum YogaAlignItems {

  start,
  center,
  end,
  stretch,
  baseline
}

//换行方式
enum YogaFlexWrap {

  noWrap, //不换行
  wrap,
  wrapReverse
}

//换行时，交叉轴上的剩余空间应该如何利用
enum YogaAlignContent {

  start,
  center,
  end,
  spaceBetween,
  spaceAround
}

enum YogaOverflow {
  none,
  auto
}

class Yoga extends StatelessWidget {

  int _flexGrow = 0;

  YogaFlexDirection _flexDirection = YogaFlexDirection.column;

  YogaAlignItems _alignItems = YogaAlignItems.start;

  YogaJustifyContent _justifyContent = YogaJustifyContent.start;

  YogaFlexWrap _flexWrap = YogaFlexWrap.noWrap;

  YogaAlignContent _alignContent = YogaAlignContent.start;

  YogaOverflow _overflow = YogaOverflow.none;

  double _width = null;

  double _height = null;

  List<Widget> _children = null;

  Yoga({
    int flex,
    YogaJustifyContent justifyContent = YogaJustifyContent.start,
    YogaAlignItems alignItems = YogaAlignItems.start,
    YogaFlexDirection flexDirection = YogaFlexDirection.column,
    YogaFlexWrap flexWrap = YogaFlexWrap.noWrap,
    YogaAlignContent alignContent = YogaAlignContent.start,
    YogaOverflow overflow = YogaOverflow.none,
    double width, double height,
    List<Widget> children = const <Widget>[]
  }) {

    _flexGrow = flex;

    _justifyContent = justifyContent;

    _alignItems = alignItems;

    _flexDirection = flexDirection;

    _flexWrap = flexWrap;

    _alignContent = alignContent;

    _overflow = overflow;

    _width = width;

    _height = height;

    _children = children;
  }

  @override
  Widget build(BuildContext context) {

    Widget widget = Container();

    var flexWrap = _flexWrap;
    switch(flexWrap) {
      case YogaFlexWrap.noWrap:
        widget = _noWrapLayout(context);
        break;
      case YogaFlexWrap.wrap:
      case YogaFlexWrap.wrapReverse:
        widget = _wrapLayout(context);
        break;
    }

    switch(_overflow) {
      case YogaOverflow.none:
        break;
      case YogaOverflow.auto:
        widget = SingleChildScrollView(child: widget,);
        break;
    }

    switch(_flexGrow) {
      case 1:
        widget = Expanded(child: widget, flex: _flexGrow,);
    }

    return widget;
  }

  Widget _noWrapLayout(BuildContext buildContext) {

    Widget widget;

    var verticalDirection = VerticalDirection.down;

    switch(_flexDirection) {
      case YogaFlexDirection.column:
      case YogaFlexDirection.row:
        verticalDirection = VerticalDirection.down;
        break;
      case YogaFlexDirection.columnReverse:
      case YogaFlexDirection.rowReverse:
        verticalDirection = VerticalDirection.up;
        break;
    }

    var mainAxisAlignment = MainAxisAlignment.start;
    switch(_justifyContent) {
      case YogaJustifyContent.start:
        mainAxisAlignment = MainAxisAlignment.start;
        break;
      case YogaJustifyContent.center:
        mainAxisAlignment = MainAxisAlignment.center;
        break;
      case YogaJustifyContent.end:
        mainAxisAlignment = MainAxisAlignment.end;
        break;
      case YogaJustifyContent.spaceBetween:
        mainAxisAlignment = MainAxisAlignment.spaceBetween;
        break;
      case YogaJustifyContent.spaceAround:
        mainAxisAlignment = MainAxisAlignment.spaceAround;
        break;
      case YogaJustifyContent.spaceEvenly:
        mainAxisAlignment = MainAxisAlignment.spaceEvenly;
        break;
    }

    var crossAxisAlignment = CrossAxisAlignment.start;
    switch(_alignItems) {
      case YogaAlignItems.start:
        crossAxisAlignment = CrossAxisAlignment.start;
        break;
      case YogaAlignItems.center:
        crossAxisAlignment = CrossAxisAlignment.center;
        break;
      case YogaAlignItems.end:
        crossAxisAlignment = CrossAxisAlignment.end;
        break;
      case YogaAlignItems.stretch:
        crossAxisAlignment = CrossAxisAlignment.stretch;
        break;
      case YogaAlignItems.baseline:
        crossAxisAlignment = CrossAxisAlignment.baseline;
        break;
    }


    switch(_flexDirection) {
      case YogaFlexDirection.column:
      case YogaFlexDirection.columnReverse:
        widget = Column(children: _children,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          verticalDirection: verticalDirection,);
        break;
      case YogaFlexDirection.row:
      case YogaFlexDirection.rowReverse:
        widget = Row(children: _children,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: verticalDirection == VerticalDirection.up ? TextDirection.rtl : TextDirection.ltr,);
        break;
    }

    return widget;
  }

  Widget _wrapLayout(BuildContext buildContext) {

    var direction = Axis.horizontal;

    var textDirection = TextDirection.ltr;

    var verticalDirection = VerticalDirection.down;

    switch(_flexDirection) {
      case YogaFlexDirection.column:
        direction = Axis.vertical;
        if(_flexWrap == YogaFlexWrap.wrapReverse) {
          textDirection = TextDirection.rtl;
        }
        break;
      case YogaFlexDirection.row:
        direction = Axis.horizontal;
        if(_flexWrap == YogaFlexWrap.wrapReverse) {
          verticalDirection = VerticalDirection.up;
        }
        break;
      case YogaFlexDirection.columnReverse:
        direction = Axis.vertical;
        verticalDirection = VerticalDirection.up;
        if(_flexWrap == YogaFlexWrap.wrapReverse) {
          textDirection = TextDirection.rtl;
        }
        break;
      case YogaFlexDirection.rowReverse:
        direction = Axis.horizontal;
        textDirection = TextDirection.rtl;
        if(_flexWrap == YogaFlexWrap.wrapReverse) {
          verticalDirection = VerticalDirection.up;
        }
        break;
    }

//    var crossAxisAlignment = WrapCrossAlignment.start;
//
//    switch(_alignContent) {
//      case YogaAlignContent.start:
//        crossAxisAlignment = WrapCrossAlignment.start;
//        break;
//      case YogaAlignContent.center:
//        crossAxisAlignment = WrapCrossAlignment.center;
//        break;
//      case YogaAlignContent.end:
//        crossAxisAlignment = WrapCrossAlignment.end;
//        break;
//    }

    var runAlignment = WrapAlignment.start;

    switch(_alignContent) {
      case YogaAlignContent.start:
        runAlignment = WrapAlignment.start;
        break;
      case YogaAlignContent.center:
        runAlignment = WrapAlignment.center;
        break;
      case YogaAlignContent.end:
        runAlignment = WrapAlignment.end;
        break;
      case YogaAlignContent.spaceAround:
        runAlignment = WrapAlignment.spaceAround;
        break;
      case YogaAlignContent.spaceBetween:
        runAlignment = WrapAlignment.spaceBetween;
        break;
    }

    Widget widget = Wrap(
      direction: direction,
      runAlignment: runAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      children: _children,);

    return widget;
  }
}