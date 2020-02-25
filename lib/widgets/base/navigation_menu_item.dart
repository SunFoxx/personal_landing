import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/widgets/base/mouse_hover.dart';

class NavigationMenuItem extends PopupMenuEntry {
  final Function onPress;
  final String text;

  NavigationMenuItem(this.text, {this.onPress});

  @override
  State<StatefulWidget> createState() => _NavigationMenuItemState();

  @override
  double get height => 50.0;

  @override
  bool represents(value) => true;
}

class _NavigationMenuItemState<T, W extends NavigationMenuItem>
    extends State<W> {
  void handleTap() {
    if (widget.onPress != null) {
      widget.onPress();
    }
    Navigator.pop<T>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MouseHover(
      child: InkWell(
        onTap: handleTap,
        hoverColor: Theme.of(context).primaryColorDark,
        child: Container(
          height: widget.height,
          width: 400,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.85),
              ),
            ),
            color: Theme.of(context).primaryColor.withOpacity(0.85),
          ),
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
