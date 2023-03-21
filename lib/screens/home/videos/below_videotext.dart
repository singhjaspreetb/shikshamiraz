import 'package:flutter/material.dart';

class BelowVideoText extends StatelessWidget {
  const BelowVideoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 25),
        child: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "Learn Various Topics of Physics and be smarter ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black))
        ])));
  }
}
