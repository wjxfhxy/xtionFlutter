
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DropdownBoxMenu<T> extends StatefulWidget {

  const DropdownBoxMenu({
    Key key,
    @required this.itemBuilder,
    this.initialValue,
    this.onSelected,
    this.onCanceled,
    this.elevation,
    this.padding = const EdgeInsets.all(8.0),
    this.child,
    this.offset = Offset.zero,
    this.enabled = true,
    this.shape,
    this.color,
    this.captureInheritedThemes = true,
  }) : assert(itemBuilder != null),
        assert(offset != null),
        assert(enabled != null),
        assert(captureInheritedThemes != null),
        assert(child != null),
        super(key: key);

  final PopupMenuItemBuilder<T> itemBuilder;

  final T initialValue;

  final PopupMenuItemSelected<T> onSelected;

  final PopupMenuCanceled onCanceled;

  final double elevation;

  final EdgeInsetsGeometry padding;

  final Widget child;

  final Offset offset;

  final bool enabled;

  final ShapeBorder shape;

  final Color color;

  final bool captureInheritedThemes;

  @override
  _DropdownBoxMenuState<T> createState() => _DropdownBoxMenuState<T>();
}

class _DropdownBoxMenuState<T> extends State<DropdownBoxMenu<T>> {
  void showButtonMenu() {
    final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
    final RenderBox button = context.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(widget.offset, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    final List<PopupMenuEntry<T>> items = widget.itemBuilder(context);
    // Only show the menu if there is something to show
    if (items.isNotEmpty) {
      showMenu<T>(
        context: context,
        elevation: widget.elevation ?? popupMenuTheme.elevation,
        items: items,
        initialValue: widget.initialValue,
        position: position,
        shape: widget.shape ?? popupMenuTheme.shape,
        color: widget.color ?? popupMenuTheme.color,
        captureInheritedThemes: widget.captureInheritedThemes,
      )
          .then<void>((T newValue) {
        if (!mounted)
          return null;
        if (newValue == null) {
          if (widget.onCanceled != null)
            widget.onCanceled();
          return null;
        }
        if (widget.onSelected != null)
          widget.onSelected(newValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

//    return InkWell(
//      onTap: widget.enabled ? showButtonMenu : null,
//      canRequestFocus: widget.enabled,
//      child: widget.child,
//    );

    return GestureDetector(
        onTap:  widget.enabled ? showButtonMenu : null,
        child: widget.child);
  }
}