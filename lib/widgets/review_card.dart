import 'dart:math' as Math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/state/model/review.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  ReviewCard(this.review);

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    bool isMobile = screenSize <= Metrics.MOBILE_DEVICE_SIZE;
    double ratingBarSize = screenSize > Metrics.MOBILE_DEVICE_SIZE
        ? 100
        : Math.max(screenSize, Metrics.MINIMAL_SCREEN_WIDTH) *
            (100 / Metrics.MOBILE_DEVICE_SIZE);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: review.reversed ? Alignment.topCenter : Alignment.topCenter,
          end: review.reversed ? Alignment.centerLeft : Alignment.bottomRight,
          colors: [
            Colors.transparent,
            Colors.white70.withOpacity(0.1),
          ],
        ),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? Metrics.HORIZONTAL_MARGIN_MOBILE
            : Metrics.HORIZONTAL_MARGIN_DESKTOP,
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: review.reversed ? TextDirection.rtl : TextDirection.ltr,
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
                    child: CircularProgressIndicator(
                      value: review.rating,
                      strokeWidth: screenSize <= Metrics.MOBILE_TINY_DEVICE_SIZE
                          ? 5
                          : 10,
                      valueColor: AlwaysStoppedAnimation(
                        Color.lerp(
                            Colors.red, Colors.greenAccent, review.rating),
                      ),
                      backgroundColor: Colors.white.withOpacity(0.05),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize <= Metrics.MOBILE_TINY_DEVICE_SIZE
                        ? 6.0
                        : 11.0,
                  ),
                  child: AutoSizeText(
                    '${review.rating * 10}/10',
                    minFontSize: 10,
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
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.25)),
          ),
          !review.reversed
              ? Container(
                  alignment: Alignment.topCenter,
                  child:
                      Text('\"', style: Theme.of(context).textTheme.headline1),
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
                    '«${review.review}»',
                    minFontSize: 14.0,
                    style: Theme.of(context).textTheme.overline,
                  ),
                  Container(
                    child: Text(
                      review.author,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ),
          ),
          review.reversed
              ? Container(
                  alignment: Alignment.topCenter,
                  child:
                      Text('\"', style: Theme.of(context).textTheme.headline1),
                  height: 120,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
