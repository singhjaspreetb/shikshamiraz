import 'package:flutter/material.dart';

class SearchVideoInput extends StatelessWidget {
  const SearchVideoInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 25),
        margin: EdgeInsets.only(top: 25, bottom: 25),
        child: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "Learn the laws of motion in a more efficient way: ",
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black))
        ])));
  }
}
