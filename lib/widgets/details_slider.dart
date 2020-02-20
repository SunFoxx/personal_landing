import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunfoxx_landing/state/page_state.dart';
import 'package:sunfoxx_landing/theme/main_theme.dart';

class DetailsSlider extends StatefulWidget {
  DetailsSlider({Key key}) : super(key: key);

  @override
  _DetailsSliderState createState() => _DetailsSliderState();
}

class _DetailsSliderState extends State<DetailsSlider> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageState>(
      builder: (context, state, child) {
        Color bgColor = state.role == Role.DEVELOPER
            ? AppColors.roleCard1
            : AppColors.roleCard2;
        Widget content = state.role == Role.NONE
            ? SizedBox()
            : AnimatedContainer(
                duration: Duration(milliseconds: 750),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: 200,
              );

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 1000),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeIn,
          child: content,
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween(
                begin: Offset(0, 2),
                end: Offset(0, 0),
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    );
  }
}
