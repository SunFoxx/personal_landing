import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

class AboutMe extends StatefulWidget {
  AboutMe({Key key}) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool showSmallnessMeme = false;
  Timer memeTimer;

  @override
  void dispose() {
    super.dispose();
    if (memeTimer != null) {
      memeTimer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile =
        MediaQuery.of(context).size.width <= Metrics.MOBILE_DEVICE_SIZE;

    return Container(
      constraints: BoxConstraints(maxWidth: Metrics.DESKTOP_MAXIMUM_SIZE),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? Metrics.HORIZONTAL_MARGIN_MOBILE
            : Metrics.HORIZONTAL_MARGIN_DESKTOP,
        vertical: 60.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            '🤝',
            style: TextStyle(fontSize: 70),
          ),
          Text(
            'Let\'s get acquainted',
            style: Theme.of(context).textTheme.headline2,
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              // Description text with a picture
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 22.0,
                                height: 1.4,
                              ),
                          children: [
                            TextSpan(
                              text:
                                  'While being a creative person I always keep my attention to ',
                            ),
                            TextSpan(
                              text: 'small',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  if (memeTimer != null) {
                                    memeTimer.cancel();
                                  }
                                  setState(() {
                                    showSmallnessMeme = true;
                                    memeTimer = Timer(
                                      Duration(seconds: 4),
                                      () => setState(() {
                                        showSmallnessMeme = false;
                                      }),
                                    );
                                  });
                                },
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.lightBlueAccent,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dashed,
                              ),
                            ),
                            TextSpan(
                                text:
                                    '\u00A0details. That\'s why my passion is shared between building beautiful and convenient interfaces and composing complex dance music.'),
                          ],
                        ),
                      ),
                    ),
                    flex: 3,
                  ),
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
                      child: Image.asset(
                        'assets/images/full_size_me.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  )
                ],
              ),
              // Meme appear
              AnimatedOpacity(
                opacity: showSmallnessMeme ? 1 : 0,
                duration: Duration(milliseconds: 750),
                curve: Curves.easeInOutCirc,
                child: Container(
                  child: Image.asset(
                    'assets/images/smallness_meme.png',
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  width: 200,
                  height: 160,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
