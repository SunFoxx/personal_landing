import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/base/web_scroll_behavior.dart';

class Screen extends StatefulWidget {
  final ScrollController scrollController;
  final List<Widget> children;

  Screen({@required this.children, scrollController})
      : this.scrollController =
            scrollController != null ? scrollController : ScrollController();

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ScrollConfiguration(
        behavior: WebScrollBehavior(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: Metrics.MINIMAL_SCREEN_WIDTH,
              maxWidth: Math.max(Metrics.MINIMAL_SCREEN_WIDTH, screenWidth),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Theme.of(context).primaryColorDark,
                          Theme.of(context).primaryColor,
                        ],
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: widget.scrollController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.children,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
