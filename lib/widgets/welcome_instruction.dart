import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/utils/constants.dart';

class WelcomeInstruction extends StatefulWidget {
  final int stepNumber;
  final String description;
  final IconData stepIcon;

  WelcomeInstruction(
      {this.stepNumber = 0, this.description = '', this.stepIcon});

  @override
  _WelcomeInstructionState createState() => _WelcomeInstructionState();
}

class _WelcomeInstructionState extends State<WelcomeInstruction> {
  @override
  Widget build(BuildContext context) {
    bool isTiny =
        MediaQuery.of(context).size.width <= Metrics.MOBILE_TINY_DEVICE_SIZE;

    return Flexible(
      child: Container(
        constraints: BoxConstraints(maxHeight: 200, minHeight: 100),
        height: isTiny ? 220 : 190,
        child: Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                widget.stepIcon,
                size: 70,
                color: Theme.of(context).accentColor,
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.only(
                  top: 35,
                  left: isTiny ? 0 : 5,
                  right: isTiny ? 0 : 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'STEP ${widget.stepNumber}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(height: isTiny ? 0 : 10),
                    Text(
                      widget.description,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: isTiny ? 12 : 16,
                          ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              top: 40,
            ),
          ],
        ),
      ),
    );
  }
}
