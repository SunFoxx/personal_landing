import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle subheadStyle = Theme.of(context).textTheme.subhead;

    return Container(
      padding: const EdgeInsets.all(10.0),
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
                    color: Color(0xffff4d00),
                  ),
                ),
              ],
            ),
          ),
          // navbar itself
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Home',
                  style: subheadStyle,
                ),
                SizedBox(width: 30),
                Text(
                  'About Me',
                  style: subheadStyle,
                ),
                SizedBox(width: 30),
                Text(
                  'Music',
                  style: subheadStyle,
                ),
                SizedBox(width: 30),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffff4d00),
                    borderRadius: BorderRadius.circular(10),
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
    );
  }
}
