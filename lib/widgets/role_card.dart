import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunfoxx_landing/state/page_state.dart';
import 'package:sunfoxx_landing/widgets/mouse_hover.dart';

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
        Widget content = widget.role == model.role
            ? widget.expandedContent
            : Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AutoSizeText(
                      widget.roleName,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 30),
                    ),
                    Text(
                      widget.roleEmoji,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 90),
                    ),
                  ],
                ),
              );

        return MouseHover(
          onHover: () {
            if (widget.role != model.role) {
              hoverController.forward();
            }
          },
          onExit: () {
            hoverController.reverse();
          },
          child: GestureDetector(
            onTap: () {
              if (widget.role != model.role && widget.onSelect != null) {
                widget.onSelect();
              }
              model
                  .setRole(model.role == widget.role ? Role.NONE : widget.role);
              hoverController.reverse();
            },
            child: ScaleTransition(
              scale: hoverAnimation,
              child: Container(
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: widget.color,
                ),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 750),
                  transitionBuilder: (wg, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(2, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(
                        opacity: animation,
                        child: wg,
                      ),
                    );
                  },
                  switchInCurve: Curves.easeInOutCirc,
                  child: content,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
