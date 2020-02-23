import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

class DeveloperDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/dev.jpg'),
            ),
          ),
          clipBehavior: Clip.hardEdge,
        ),
        Container(
          color: Colors.grey[800].withOpacity(0.7),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          alignment: Alignment.center,
          child: LayoutBuilder(
            builder: (_, constraints) {
              bool isMobile = MediaQuery.of(context).size.width <=
                  Metrics.MOBILE_DEVICE_SIZE;
              return Column(
                mainAxisAlignment: isMobile
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: isMobile ? 60 : 75),
                  FittedBox(
                    child: Container(
                      child: AutoSizeText.rich(
                        TextSpan(
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                              shadows: [
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Colors.black.withOpacity(0.65),
                                )
                              ],
                              height: 1.3,
                            ),
                            children: [
                              TextSpan(
                                text: "Cross-platform developer\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 35.0),
                              ),
                              TextSpan(
                                text:
                                    "experienced with client-side tools\nthat target several platforms",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.0),
                              ),
                            ]),
                        textScaleFactor: isMobile ? 0.8 : 1,
                        textAlign: TextAlign.center,
                        maxFontSize: 32.0,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
