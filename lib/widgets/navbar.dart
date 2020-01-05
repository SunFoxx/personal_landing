import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle subheadStyle = Theme.of(context).textTheme.subhead;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Metrics.MOBILE_DEVICE_SIZE) {
          return Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Image(
                height: Metrics.NAVBAR_HEADER_HEIGHT,
                image: AssetImage('assets/images/me.jpg'),
                fit: BoxFit.fitWidth,
                width: double.infinity,
                alignment: Alignment.topCenter,
                color: Colors.white.withOpacity(0.55),
                colorBlendMode: BlendMode.hue,
                filterQuality: FilterQuality.medium,
              ),
              Container(
                padding: const EdgeInsets.all(Metrics.NAVBAR_MARGIN_DESKTOP),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Theme.of(context).primaryColorDark.withOpacity(0.3),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // logo
                    RichText(
                      text: TextSpan(
                        text: 'Sun',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 48.0,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2.0, 1.0),
                              blurRadius: 10.0,
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
                          SizedBox(width: Metrics.NAVBAR_MARGIN_DESKTOP),
                          Text(
                            'About Me',
                            style: subheadStyle,
                          ),
                          SizedBox(width: Metrics.NAVBAR_MARGIN_DESKTOP),
                          Text(
                            'Music',
                            style: subheadStyle,
                          ),
                          SizedBox(width: Metrics.NAVBAR_MARGIN_DESKTOP),
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
              ),
            ],
          );
        } else {
          return SafeArea(
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                Positioned.fill(
                  child: Image(
                    image: AssetImage('assets/images/me.jpg'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    color: Colors.white.withOpacity(0.55),
                    colorBlendMode: BlendMode.hue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(Metrics.NAVBAR_MARGIN_MOBILE),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Theme.of(context).primaryColorDark.withOpacity(0.15),
                        Theme.of(context).primaryColorDark.withOpacity(0.95),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // logo
                      RichText(
                        text: TextSpan(
                          text: 'Sun',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 42.0,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2.0, 1.0),
                                blurRadius: 8.0,
                              )
                            ],
                          ),
                          children: [
                            TextSpan(
                              text: 'Foxx',
                              style: TextStyle(
                                color: Color(0xffff4d00),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // navbar itself
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Home',
                              style: subheadStyle,
                            ),
                            SizedBox(height: Metrics.NAVBAR_MARGIN_MOBILE),
                            Text(
                              'About Me',
                              style: subheadStyle,
                            ),
                            SizedBox(height: Metrics.NAVBAR_MARGIN_MOBILE),
                            Text(
                              'Music',
                              style: subheadStyle,
                            ),
                            SizedBox(height: Metrics.NAVBAR_MARGIN_MOBILE),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
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
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
