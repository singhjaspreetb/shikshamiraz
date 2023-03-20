import 'package:flutter/material.dart';

class BelowText extends StatelessWidget {
  const BelowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 25),
        child: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "What Subject do You want\n to learn today ? ",
              style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black))
        ])));
  }
}
