import 'dart:math' as Math;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/painters/triangle.dart';

class AboutMeHeader extends StatelessWidget {
  Widget buildMobile(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0, top: 15.0),
      constraints: BoxConstraints.loose(Size(double.infinity, 200)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Avatar ring
          Container(
            padding: EdgeInsets.only(right: 10.0),
            constraints: BoxConstraints(maxWidth: 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // text blob
                Container(
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        child: Container(
                          alignment: Alignment.center,
                          child: TyperAnimatedTextKit(
                            text: ['Hi, it\'s me!'],
                            textStyle: Theme.of(context).textTheme.caption,
                            isRepeatingAnimation: true,
                            speed: Duration(milliseconds: 50),
                            pause: Duration(seconds: 7),
                          ),
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 15,
                        height: 15,
                        bottom: -10,
                        left: 0,
                        child: Transform.rotate(
                          angle: Math.pi,
                          child: CustomPaint(
                            size: Size(1, 1),
                            painter: TrianglePainter(vertexPosition: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.rotate(
                  angle: -Math.pi / 4,
                  child: Transform.scale(
                    scale: 0.9,
                    child: Container(
                      margin: EdgeInsets.only(right: 75, top: 10),
                      color: Colors.grey[900].withOpacity(0.8),
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: Offset(-7, -7),
                        child: Container(
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/me.jpg')),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Description
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Container(
                    child: AutoSizeText(
                      'Egor Sharoha',
                      maxLines: 2,
                      minFontSize: 22.0,
                      textScaleFactor: 0.9,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 38,
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: AutoSizeText.rich(
                    TextSpan(
                      style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: 18,
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(1.0, 1.0),
                            blurRadius: 1.0,
                          )
                        ],
                      ),
                      children: [
                        TextSpan(text: 'Cross-platform ', children: [
                          TextSpan(
                            text: 'developer',
                            style: TextStyle(color: Colors.greenAccent[100]),
                          )
                        ]),
                        TextSpan(text: ', electronic ', children: [
                          TextSpan(
                            text: 'music artist',
                            style: TextStyle(color: Colors.purple[100]),
                          )
                        ]),
                        TextSpan(text: ', bad joker')
                      ],
                    ),
                    minFontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        MediaQuery.of(context).size.width <= Metrics.MOBILE_DEVICE_SIZE;

    if (!isMobile) {
      return Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(bottom: 10.0, top: 15.0),
        constraints: BoxConstraints.expand(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Avatar ring
            Container(
              padding: EdgeInsets.only(right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: Container(
                            alignment: Alignment.center,
                            child: TyperAnimatedTextKit(
                              text: ['Hi, it\'s me!'],
                              textStyle: Theme.of(context).textTheme.caption,
                              isRepeatingAnimation: true,
                              speed: Duration(milliseconds: 50),
                              pause: Duration(seconds: 7),
                            ),
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          width: 15,
                          height: 15,
                          bottom: -10,
                          left: 0,
                          child: Transform.rotate(
                            angle: Math.pi,
                            child: CustomPaint(
                              size: Size(1, 1),
                              painter: TrianglePainter(vertexPosition: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Transform.rotate(
                      angle: -Math.pi / 4,
                      child: Transform.scale(
                        scale: 0.7,
                        child: Container(
                          margin: EdgeInsets.only(right: 25, top: 20),
                          color: Colors.grey[900].withOpacity(0.8),
                          alignment: Alignment.center,
                          child: Transform.translate(
                            offset: Offset(-15, -15),
                            child: Container(
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/me.jpg')),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Description
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Egor Sharoha',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                      shadows: <Shadow>[
                        Shadow(
                          color: Colors.black.withOpacity(0.6),
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline3.copyWith(
                          shadows: <Shadow>[
                            Shadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: Offset(1.0, 1.0),
                              blurRadius: 1.0,
                            )
                          ],
                        ),
                        children: [
                          TextSpan(text: 'Cross-platform ', children: [
                            TextSpan(
                              text: 'developer',
                              style: TextStyle(color: Colors.greenAccent[100]),
                            )
                          ]),
                          TextSpan(text: ', electronic ', children: [
                            TextSpan(
                              text: 'music artist',
                              style: TextStyle(color: Colors.purple[100]),
                            )
                          ]),
                          TextSpan(text: ', bad joker')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return buildMobile(context);
    }
  }
}
