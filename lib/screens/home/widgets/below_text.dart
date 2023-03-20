import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class BelowText extends StatelessWidget {
  const BelowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 25),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "What Subject do You want\n to learn today ? ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black))
        ])));
  }
}
