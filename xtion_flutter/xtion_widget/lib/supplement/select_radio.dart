// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const double _kOuterRadius = 8.0;
const double _kInnerRadius = 4.5;

// class SelectRadio<T> extends StatefulWidget {
//
//   const SelectRadio({
//     Key key,
//     @required this.value,
//     @required this.groupValue,
//     @required this.onChanged,
//     this.activeColor,
//     this.focusColor,
//     this.hoverColor,
//     this.materialTapTargetSize,
//     this.focusNode,
//     this.autofocus = false,
//   }) : assert(autofocus != null),
//        super(key: key);
//
//   final T value;
//
//   final T groupValue;
//
//   final ValueChanged<T> onChanged;
//
//   final Color activeColor;
//
//   final MaterialTapTargetSize materialTapTargetSize;
//
//   final Color focusColor;
//
//   final Color hoverColor;
//
//   final FocusNode focusNode;
//
//   final bool autofocus;
//
//   @override
//   _RadioState<T> createState() => _RadioState<T>();
// }
//
// class _RadioState<T> extends State<SelectRadio<T>> with TickerProviderStateMixin {
//   bool get enabled => widget.onChanged != null;
//   Map<LocalKey, ActionFactory> _actionMap;
//
//   @override
//   void initState() {
//     super.initState();
//     _actionMap = <LocalKey, ActionFactory>{
//       SelectAction.key: _createAction,
//       if (!kIsWeb) ActivateAction.key: _createAction,
//     };
//   }
//
//   void _actionHandler(FocusNode node, Intent intent){
//     if (widget.onChanged != null) {
//       widget.onChanged(widget.value);
//     }
//     final RenderObject renderObject = node.context.findRenderObject();
//     renderObject.sendSemanticsEvent(const TapSemanticEvent());
//   }
//
//   Action _createAction() {
//     return CallbackAction(
//       SelectAction.key,
//       onInvoke: _actionHandler,
//     );
//   }
//
//   bool _focused = false;
//   void _handleHighlightChanged(bool focused) {
//     if (_focused != focused) {
//       setState(() { _focused = focused; });
//     }
//   }
//
//   bool _hovering = false;
//   void _handleHoverChanged(bool hovering) {
//     if (_hovering != hovering) {
//       setState(() { _hovering = hovering; });
//     }
//   }
//
//   Color _getInactiveColor(ThemeData themeData) {
//     return enabled ? themeData.unselectedWidgetColor : themeData.disabledColor;
//   }
//
//   void _handleChanged(bool selected) {
//
//     widget.onChanged(selected == null ? null: widget.value);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     assert(debugCheckHasMaterial(context));
//     final ThemeData themeData = Theme.of(context);
//     Size size;
//     switch (widget.materialTapTargetSize ?? themeData.materialTapTargetSize) {
//       case MaterialTapTargetSize.padded:
//         size = const Size(2 * kRadialReactionRadius + 8.0, 2 * kRadialReactionRadius + 8.0);
//         break;
//       case MaterialTapTargetSize.shrinkWrap:
//         size = const Size(2 * kRadialReactionRadius, 2 * kRadialReactionRadius);
//         break;
//     }
//     final BoxConstraints additionalConstraints = BoxConstraints.tight(size);
//     return FocusableActionDetector(
//       actions: _actionMap,
//       focusNode: widget.focusNode,
//       autofocus: widget.autofocus,
//       enabled: enabled,
//       onShowFocusHighlight: _handleHighlightChanged,
//       onShowHoverHighlight: _handleHoverChanged,
//       child: Builder(
//         builder: (BuildContext context) {
//           return _RadioRenderObjectWidget(
//             selected: widget.value == widget.groupValue,
//             activeColor: widget.activeColor ?? themeData.toggleableActiveColor,
//             inactiveColor: _getInactiveColor(themeData),
//             focusColor: widget.focusColor ?? themeData.focusColor,
//             hoverColor: widget.hoverColor ?? themeData.hoverColor,
//             onChanged: enabled ? _handleChanged : null,
//             additionalConstraints: additionalConstraints,
//             vsync: this,
//             hasFocus: _focused,
//             hovering: _hovering,
//           );
//         },
//       ),
//     );
//   }
// }
//
// class _RadioRenderObjectWidget extends LeafRenderObjectWidget {
//   const _RadioRenderObjectWidget({
//     Key key,
//     @required this.selected,
//     @required this.activeColor,
//     @required this.inactiveColor,
//     @required this.focusColor,
//     @required this.hoverColor,
//     @required this.additionalConstraints,
//     this.onChanged,
//     @required this.vsync,
//     @required this.hasFocus,
//     @required this.hovering,
//   }) : assert(selected != null),
//        assert(activeColor != null),
//        assert(inactiveColor != null),
//        assert(vsync != null),
//        super(key: key);
//
//   final bool selected;
//   final bool hasFocus;
//   final bool hovering;
//   final Color inactiveColor;
//   final Color activeColor;
//   final Color focusColor;
//   final Color hoverColor;
//   final ValueChanged<bool> onChanged;
//   final TickerProvider vsync;
//   final BoxConstraints additionalConstraints;
//
//   @override
//   _RenderRadio createRenderObject(BuildContext context) => _RenderRadio(
//     value: selected,
//     activeColor: activeColor,
//     inactiveColor: inactiveColor,
//     focusColor: focusColor,
//     hoverColor: hoverColor,
//     onChanged: onChanged,
//     vsync: vsync,
//     additionalConstraints: additionalConstraints,
//     hasFocus: hasFocus,
//     hovering: hovering,
//   );
//
//   @override
//   void updateRenderObject(BuildContext context, _RenderRadio renderObject) {
//     renderObject
//       ..value = selected
//       ..activeColor = activeColor
//       ..inactiveColor = inactiveColor
//       ..focusColor = focusColor
//       ..hoverColor = hoverColor
//       ..onChanged = onChanged
//       ..additionalConstraints = additionalConstraints
//       ..vsync = vsync
//       ..hasFocus = hasFocus
//       ..hovering = hovering;
//   }
// }
//
// class _RenderRadio extends RenderToggleable {
//   _RenderRadio({
//     bool value,
//     Color activeColor,
//     Color inactiveColor,
//     Color focusColor,
//     Color hoverColor,
//     ValueChanged<bool> onChanged,
//     BoxConstraints additionalConstraints,
//     @required TickerProvider vsync,
//     bool hasFocus,
//     bool hovering,
//   }) : super(
//          value: value,
//          tristate: true,
//          activeColor: activeColor,
//          inactiveColor: inactiveColor,
//          focusColor: focusColor,
//          hoverColor: hoverColor,
//          onChanged: onChanged,
//          additionalConstraints: additionalConstraints,
//          vsync: vsync,
//          hasFocus: hasFocus,
//          hovering: hovering,
//        );
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     final Canvas canvas = context.canvas;
//
//     paintRadialReaction(canvas, offset, size.center(Offset.zero));
//
//     final Offset center = (offset & size).center;
//     final Color radioColor = onChanged != null ? activeColor : inactiveColor;
//
//     // Outer circle
//     final Paint paint = Paint()
//       ..color = Color.lerp(inactiveColor, radioColor, position.value)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0;
//     canvas.drawCircle(center, _kOuterRadius, paint);
//
//     // Inner circle
//     if (!position.isDismissed) {
//       paint.style = PaintingStyle.fill;
//       canvas.drawCircle(center, _kInnerRadius * position.value, paint);
//     }
//   }
//
//   @override
//   void describeSemanticsConfiguration(SemanticsConfiguration config) {
//     super.describeSemanticsConfiguration(config);
//     config
//       ..isInMutuallyExclusiveGroup = true
//       ..isChecked = value == true;
//   }
// }
