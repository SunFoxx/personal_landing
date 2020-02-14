import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

class ReviewCard extends StatelessWidget {
  final double rating;
  final String review;
  final String author;
  final bool reversed;

  ReviewCard({
    this.rating = 1.0,
    this.review = '',
    this.author = '',
    this.reversed = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    bool isMobile = screenSize <= Metrics.MOBILE_DEVICE_SIZE;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: reversed ? Alignment.topCenter : Alignment.topCenter,
          end: reversed ? Alignment.centerLeft : Alignment.bottomRight,
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
        textDirection: reversed ? TextDirection.rtl : TextDirection.ltr,
        children: <Widget>[
          Container(
            width: screenSize > Metrics.MOBILE_DEVICE_SIZE
                ? 100
                : screenSize * (100 / Metrics.MOBILE_DEVICE_SIZE),
            height: screenSize > Metrics.MOBILE_DEVICE_SIZE
                ? 125
                : screenSize * (100 / Metrics.MOBILE_DEVICE_SIZE) + 25,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
                    child: CircularProgressIndicator(
                      value: rating,
                      strokeWidth: screenSize <= Metrics.MOBILE_TINY_DEVICE_SIZE
                          ? 5
                          : 10,
                      valueColor: AlwaysStoppedAnimation(
                        Color.lerp(Colors.red, Colors.greenAccent, rating),
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
                    '${rating * 10}/10',
                    minFontSize: 14,
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
          !reversed
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
                    '«$review»',
                    minFontSize: 14.0,
                    style: Theme.of(context).textTheme.overline,
                  ),
                  Container(
                    child: Text(
                      author,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ),
          ),
          reversed
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
