import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

import 'about_me_header.dart';
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
            child: AboutMeHeader(),
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
              constraints:
                  BoxConstraints(maxWidth: Metrics.DESKTOP_MAXIMUM_SIZE),
              padding: const EdgeInsets.fromLTRB(
                Metrics.HORIZONTAL_MARGIN_DESKTOP,
                Metrics.HORIZONTAL_MARGIN_DESKTOP,
                Metrics.HORIZONTAL_MARGIN_DESKTOP,
                0,
              ),
              child: AboutMeHeader(),
            ),
          ),
        ],
      );
    } else {
      return buildMobile(context);
    }
  }
}
