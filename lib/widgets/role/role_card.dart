import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunfoxx_landing/state/page_state.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/base/mouse_hover.dart';

class RoleCard extends StatefulWidget {
  final Role role;
  final String roleName;
  final String roleEmoji;
  final Color color;
  final Widget expandedContent;
  final Function onSelect;

  RoleCard({
    @required this.role,
    this.roleName = '',
    this.roleEmoji = '',
    this.color = Colors.white,
    this.expandedContent = const SizedBox(),
    this.onSelect,
  });

  @override
  _RoleCardState createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard>
    with SingleTickerProviderStateMixin {
  AnimationController hoverController;
  Animation<double> hoverAnimation;

  @override
  void initState() {
    super.initState();
    hoverController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    hoverAnimation = Tween(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: hoverController,
        curve: Curves.easeInBack,
        reverseCurve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    hoverController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageState>(
      builder: (_, model, child) {
        bool isSelected = model.role == widget.role;
        Widget content = isSelected
            ? widget.expandedContent
            : Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 90),
                      AutoSizeText(
                        widget.roleName,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              );

        return MouseHover(
          onHover: () {
            if (!isSelected) {
              hoverController.forward();
            }
          },
          onExit: () {
            hoverController.reverse();
          },
          child: GestureDetector(
            onTap: () {
              if (!isSelected && widget.onSelect != null) {
                widget.onSelect();
              }
              model.setRole(isSelected ? Role.NONE : widget.role);
              hoverController.reverse();
            },
            child: ScaleTransition(
              scale: hoverAnimation,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                clipBehavior: Clip.antiAlias,
                child: AnimatedContainer(
                  duration: Metrics.ANIMATION_DURATION,
                  height: 200 * hoverAnimation.value,
                  width:
                      MediaQuery.of(context).size.width * hoverAnimation.value,
                  alignment: Alignment.center,
                  color: widget.color,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 750),
                    switchInCurve: Curves.easeInOutCirc,
                    child: content,
                    layoutBuilder: (currentChild, previousChildren) {
                      return Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          ...previousChildren,
                          if (currentChild != null) currentChild,
                          AnimatedContainer(
                            duration: Metrics.ANIMATION_DURATION,
                            padding: EdgeInsets.only(
                              top: isSelected ? 10.0 : 0.0,
                              bottom: isSelected ? 0 : 50,
                            ),
                            alignment: Alignment.topCenter,
                            child: AnimatedDefaultTextStyle(
                              duration: Metrics.ANIMATION_DURATION,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(fontSize: isSelected ? 45 : 90),
                              child: AutoSizeText(widget.roleEmoji),
                            ),
                          ),
                        ],
                        alignment: Alignment.center,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
