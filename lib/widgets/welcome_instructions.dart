import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/welcome_instruction.dart';

class WelcomeInstructions extends StatefulWidget {
  @override
  _WelcomeInstructionsState createState() => _WelcomeInstructionsState();
}

class _WelcomeInstructionsState extends State<WelcomeInstructions> {
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
        vertical: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WelcomeInstruction(
            stepNumber: 1,
            description:
                '${isMobile ? 'Tap' : 'Click'} on the role you interested in',
            stepIcon: FontAwesome.hand_o_up,
          ),
          SizedBox(width: 15),
          WelcomeInstruction(
            stepNumber: 2,
            description:
                'Get familiar with all details related to selected role',
            stepIcon: FontAwesome5.check_circle,
          ),
          SizedBox(width: 15),
          WelcomeInstruction(
            stepNumber: 3,
            description:
                'Fill contact form if you interested in any kind of collaboration',
            stepIcon: Ionicons.ios_chatbubbles,
          ),
        ],
      ),
    );
  }
}
