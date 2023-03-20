import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Container(
          margin: EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black.withOpacity(0.1)),
          ),
          // ignore: prefer_const_constructors
          child: TextField(
              cursorColor: Colors.black,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.all(18),
                border: InputBorder.none,
                hintText: 'Search for Physics , Chemistry or Maths,....',
                hintStyle: const TextStyle(color: Colors.grey),
              )),
        )
      ],
    ));
  }
}
