import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

class BackgroundMosaic extends StatefulWidget {
  @override
  _BackgroundMosaicState createState() => _BackgroundMosaicState();
}

class _BackgroundMosaicState extends State<BackgroundMosaic> {
  @override
  Widget build(BuildContext context) {
    Color backgroundPurple1 = Colors.pinkAccent.withOpacity(0.5);
    Color backgroundPurple2 = Colors.purple[800].withOpacity(0.6);

    Color backgroundBlue1 = Colors.cyanAccent;
    Color backgroundBlue2 = Colors.lightBlue[900];

    List<double> stops = List();
    List<Color> purpleColors = List();
    List<Color> blueColors = List();

    for (double i = 0; i <= 1; i += 0.2) {
      purpleColors.add(Color.lerp(backgroundPurple1, backgroundPurple2, i));
      blueColors.add(Color.lerp(backgroundBlue1, backgroundBlue2, i));
      stops.add(i);

      if (i != 1 && i != 0) {
        purpleColors
            .add(Color.lerp(backgroundPurple1, backgroundPurple2, i + 0.2));
        blueColors.add(Color.lerp(backgroundBlue1, backgroundBlue2, i + 0.2));
        stops.add(i);
      }
    }

    double yOffset =
        MediaQuery.of(context).size.width <= Metrics.MOBILE_DEVICE_SIZE
            ? 1.4
            : 2.0;

    return Container(
      child: Stack(
        children: <Widget>[
          ControlledAnimation(
            duration: Duration(seconds: 4),
            tween: Tween(begin: -0.2, end: 0.2),
            playback: Playback.MIRROR,
            curve: Curves.linear,
            builder: (context, value) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.0 + value, yOffset),
                    end: Alignment(1.0 + value, -yOffset),
                    colors: blueColors.reversed.toList(),
                    stops: stops,
                  ),
                ),
              );
            },
          ),
          ControlledAnimation(
            duration: Duration(seconds: 9),
            tween: Tween(begin: 0.2, end: -0.2),
            playback: Playback.MIRROR,
            builder: (context, value) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.0 + value, yOffset),
                    end: Alignment(-1.0 + value, -yOffset),
                    colors: purpleColors,
                    stops: stops,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
