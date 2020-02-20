import 'dart:math' as Math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:sunfoxx_landing/state/model/review.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

class ReviewCard extends StatefulWidget {
  final Review review;

  ReviewCard(this.review);

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard>
    with SingleTickerProviderStateMixin {
  AnimationController _appearController;
  Animation<double> _appearAnimation;

  @override
  void initState() {
    _appearController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _appearAnimation =
        Tween<double>(begin: 0.0, end: this.widget.review.rating).animate(
      CurvedAnimation(
        parent: _appearController,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _appearController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isShown = false;
    double screenSize = MediaQuery.of(context).size.width;
    bool isMobile = screenSize <= Metrics.MOBILE_DEVICE_SIZE;
    bool isTiny = screenSize <= Metrics.MOBILE_TINY_DEVICE_SIZE;
    double horizontalPadding = isMobile
        ? Metrics.HORIZONTAL_MARGIN_MOBILE
        : Metrics.HORIZONTAL_MARGIN_DESKTOP;

    double ratingBarSize = screenSize > Metrics.MOBILE_DEVICE_SIZE
        ? 100
        : Math.max(screenSize, Metrics.MINIMAL_SCREEN_WIDTH) *
            (100 / Metrics.MOBILE_DEVICE_SIZE);

    return VisibilityDetector(
      key: Key(widget.review.review.substring(0, 10)),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.34 && isShown == false) {
          isShown = true;
          _appearController.forward();
        }
      },
      child: FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(_appearController),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: widget.review.reversed
                  ? Alignment.centerLeft
                  : Alignment.bottomRight,
              colors: [
                Colors.transparent,
                Colors.white70.withOpacity(0.1),
              ],
            ),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: isTiny ? 0.0 : horizontalPadding,
            vertical: 10.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection:
                widget.review.reversed ? TextDirection.rtl : TextDirection.ltr,
            children: <Widget>[
              Container(
                width: ratingBarSize,
                height: screenSize > Metrics.MOBILE_DEVICE_SIZE
                    ? 125
                    : ratingBarSize + 25,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: AnimatedBuilder(
                            animation: _appearAnimation,
                            builder: (context, child) {
                              return CircularProgressIndicator(
                                value: _appearAnimation.value,
                                strokeWidth: screenSize <=
                                        Metrics.MOBILE_TINY_DEVICE_SIZE
                                    ? 5
                                    : 10,
                                valueColor: AlwaysStoppedAnimation(
                                  Color.lerp(
                                    Colors.red,
                                    Colors.greenAccent,
                                    _appearAnimation.value,
                                  ),
                                ),
                                backgroundColor: Colors.white.withOpacity(0.05),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            screenSize <= Metrics.MOBILE_TINY_DEVICE_SIZE
                                ? 7.0
                                : 11.0,
                      ),
                      child: AutoSizeText(
                        '${widget.review.rating * 10}/10',
                        minFontSize: 9,
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.white.withOpacity(0.85)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: isMobile ? 4 : 10,
                  vertical: 0,
                ),
                width: 1,
                height: 100,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: Colors.white.withOpacity(0.25)),
              ),
              !widget.review.reversed
                  ? Container(
                      alignment: Alignment.topCenter,
                      child: Text('\"',
                          style: Theme.of(context).textTheme.headline1),
                      height: 120,
                    )
                  : SizedBox(),
              Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(height: 120),
                  padding: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Stack(
                    children: <Widget>[
                      AutoSizeText(
                        '«${widget.review.review}»',
                        minFontSize: 14.0,
                        style: Theme.of(context).textTheme.overline,
                      ),
                      Container(
                        child: Text(
                          widget.review.author,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                    ],
                  ),
                ),
              ),
              widget.review.reversed
                  ? Container(
                      alignment: Alignment.topCenter,
                      child: Text('\"',
                          style: Theme.of(context).textTheme.headline1),
                      height: 120,
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
