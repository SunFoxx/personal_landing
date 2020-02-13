import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

import 'about_me.dart';
import 'background_mosaic.dart';

class Navbar extends StatelessWidget {
  Widget buildMobile(BuildContext context) {
    TextStyle subheadStyle = Theme.of(context).textTheme.subtitle1;

    return SafeArea(
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: Metrics.NAVBAR_HEADER_HEIGHT),
            child: BackgroundMosaic(),
          ),
          Padding(
            padding: const EdgeInsets.all(Metrics.HORIZONTAL_MARGIN_MOBILE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // logo
                Container(
                  width: double.infinity,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Sun',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 42.0,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black.withOpacity(0.7),
                            offset: Offset(2.0, 1.0),
                            blurRadius: 6.0,
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
                // navbar itself
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Home',
                        style: subheadStyle,
                      ),
                      SizedBox(height: Metrics.HORIZONTAL_MARGIN_MOBILE),
                      Text(
                        'About Me',
                        style: subheadStyle,
                      ),
                      SizedBox(height: Metrics.HORIZONTAL_MARGIN_MOBILE),
                      Text(
                        'Music',
                        style: subheadStyle,
                      ),
                      SizedBox(height: Metrics.HORIZONTAL_MARGIN_MOBILE - 5),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Contact',
                          style: subheadStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                AboutMe(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle subheadStyle = Theme.of(context).textTheme.subtitle1;
    bool isMobile =
        MediaQuery.of(context).size.width <= Metrics.MOBILE_DEVICE_SIZE;

    if (!isMobile) {
      return Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: Metrics.NAVBAR_HEADER_HEIGHT),
            child: BackgroundMosaic(),
          ),
          Positioned.fill(
            bottom: -1,
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(
                Metrics.HORIZONTAL_MARGIN_DESKTOP,
                Metrics.HORIZONTAL_MARGIN_DESKTOP,
                Metrics.HORIZONTAL_MARGIN_DESKTOP,
                0,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // logo
                      Expanded(
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
                      // navbar itself
                      Container(
                        child: Row(
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
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
                      ),
                    ],
                  ),
                  Expanded(
                    child: AboutMe(),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return buildMobile(context);
    }
  }
}
