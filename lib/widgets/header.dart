import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

import 'about_me.dart';
import 'background_mosaic.dart';

class Header extends StatelessWidget {
  Widget buildMobile(BuildContext context) {
    return SafeArea(
      child: Stack(
        overflow: Overflow.clip,
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: Metrics.NAVBAR_HEADER_HEIGHT - 150),
            child: BackgroundMosaic(),
          ),
          Padding(
            padding: const EdgeInsets.all(Metrics.HORIZONTAL_MARGIN_MOBILE),
            child: AboutMe(),
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
              child: AboutMe(),
            ),
          ),
        ],
      );
    } else {
      return buildMobile(context);
    }
  }
}
