import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/base/mouse_hover.dart';
import 'package:sunfoxx_landing/widgets/base/navigation_menu_item.dart';

class Navbar extends StatefulWidget {
  final ScrollController scrollController;

  Navbar({@required this.scrollController});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with SingleTickerProviderStateMixin {
  static final double navbarHeight = 75;
  double preservedOffset = 0;
  double scrollLength = 0;
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    ScrollController _controller = widget.scrollController;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutSine,
      ),
    );

    _controller.addListener(() {
      if (_controller.offset < navbarHeight) {
        _animationController.reverse();
      } else {
        double delta = _controller.offset - preservedOffset;
        scrollLength = delta < 0
            ? Math.max(0, scrollLength + delta)
            : Math.min(navbarHeight * 2, scrollLength + delta);
        if (scrollLength == 0) {
          _animationController.reverse();
        }
        if (scrollLength == navbarHeight * 2) {
          _animationController.forward();
        }
      }
      preservedOffset = _controller.offset;
    });
  }

  double getLogoScale(double animationValue) {
    double change = 0;
    if (animationValue < 0.9) {
      change = 0.6 * animationValue;
    } else {
      change = (0.6 * 0.9) + ((0.9 - animationValue) * 1.5);
    }

    return 1.0 - change;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle subheadStyle = Theme.of(context).textTheme.subtitle1;
    bool isMobile =
        MediaQuery.of(context).size.width <= Metrics.MOBILE_DEVICE_SIZE;

    if (!isMobile) {
      return AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          double scrollAnimation = _animation.value;
          return Transform.translate(
            offset: Offset(0, 0 - (navbarHeight * scrollAnimation)),
            child: Transform(
              transform: Matrix4.rotationX(Math.pi * 2 * scrollAnimation),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: navbarHeight,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3.0,
                    )
                  ],
                  gradient: LinearGradient(colors: [
                    Colors.grey[900].withOpacity(0.8 -
                        (scrollAnimation < 0.6 ? 0 : scrollAnimation - 0.6)),
                    Colors.indigo[900].withOpacity(0.8 -
                        (scrollAnimation < 0.6 ? 0 : scrollAnimation - 0.6)),
                  ]),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? Metrics.HORIZONTAL_MARGIN_MOBILE
                      : Metrics.HORIZONTAL_MARGIN_DESKTOP,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Logo
                    Transform.scale(
                      scale: getLogoScale(scrollAnimation),
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          scrollAnimation < 0.75
                              ? 0
                              : navbarHeight * 1.5 * scrollAnimation,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'Sun',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 48.0,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  color: Colors.black.withOpacity(0.7),
                                  offset: Offset(2.0, 1.0),
                                  blurRadius: 5.0,
                                )
                              ],
                            ),
                            children: [
                              TextSpan(
                                text: 'Foxx',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Home',
                          style: subheadStyle,
                        ),
                        SizedBox(width: Metrics.HORIZONTAL_MARGIN_DESKTOP),
                        Text(
                          'About Me',
                          style: subheadStyle,
                        ),
                        SizedBox(width: Metrics.HORIZONTAL_MARGIN_DESKTOP),
                        Text(
                          'Music',
                          style: subheadStyle,
                        ),
                        SizedBox(width: Metrics.HORIZONTAL_MARGIN_DESKTOP),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Contact',
                            style: subheadStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return buildMobile(context);
    }
  }

  Widget buildMobile(BuildContext context) {
    TextStyle subheadStyle = Theme.of(context).textTheme.subtitle1;

    return SafeArea(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          double scrollAnimation = _animation.value;
          return Transform.translate(
            offset: Offset(0, 0 - (navbarHeight * scrollAnimation)),
            child: Transform(
              transform: Matrix4.rotationX(Math.pi * 2 * scrollAnimation),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: navbarHeight,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3.0,
                    )
                  ],
                  gradient: LinearGradient(colors: [
                    Colors.grey[900].withOpacity(0.8 -
                        (scrollAnimation < 0.6 ? 0 : scrollAnimation - 0.6)),
                    Colors.indigo[900].withOpacity(0.8 -
                        (scrollAnimation < 0.6 ? 0 : scrollAnimation - 0.6)),
                  ]),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Metrics.HORIZONTAL_MARGIN_MOBILE,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Logo
                    Transform.scale(
                      scale: getLogoScale(scrollAnimation),
                      child: Transform.translate(
                        offset: Offset(
                          0,
                          scrollAnimation < 0.75
                              ? 0
                              : navbarHeight * 1.5 * scrollAnimation,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'Sun',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 48.0,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  color: Colors.black.withOpacity(0.7),
                                  offset: Offset(2.0, 1.0),
                                  blurRadius: 5.0,
                                )
                              ],
                            ),
                            children: [
                              TextSpan(
                                text: 'Foxx',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    MouseHover(
                      child: PopupMenuButton(
                        color: Colors.transparent,
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        offset: Offset(0, 28),
                        icon: Text(
                          '🔽',
                          style: TextStyle(fontSize: 25, shadows: [
                            Shadow(blurRadius: 3.0, offset: Offset(1.0, 2.0))
                          ]),
                        ),
                        itemBuilder: (context) {
                          return [
                            NavigationMenuItem('Home'),
                            NavigationMenuItem('About Me'),
                            NavigationMenuItem('Music'),
                            NavigationMenuItem('Contact'),
                          ];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
