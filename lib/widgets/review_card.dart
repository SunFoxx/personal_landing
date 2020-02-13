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
        horizontal: Metrics.HORIZONTAL_MARGIN_DESKTOP,
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: reversed ? TextDirection.rtl : TextDirection.ltr,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 125,
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
                child: CircularProgressIndicator(
                  value: rating,
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation(
                    Color.lerp(Colors.red, Colors.greenAccent, rating),
                  ),
                  backgroundColor: Colors.white.withOpacity(0.05),
                ),
              ),
              Text(
                '${rating * 10}/10',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Colors.white.withOpacity(0.85)),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                  Text(
                    '«$review»',
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
