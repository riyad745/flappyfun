// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';

import '../../Database/database.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';

class BirdSettings extends StatelessWidget {
  const BirdSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: myText("Characters", Colors.black, 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Str.bird = "assets/pics/doge.png";
                write("bird", Str.bird);
              },
              child: SizedBox(
                width: 75,
                height: 75,
                child: Image.asset(
                  "assets/pics/doge.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Str.bird = "assets/pics/monkey.png";
                write("bird", Str.bird);
              },
              child: SizedBox(
                width: 75,
                height: 75,
                child: Image.asset(
                  "assets/pics/monkey.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Str.bird = "assets/pics/mouse.png";
            //     write("bird", Str.bird);
            //   },
            //   child: SizedBox(
            //     width: 75,
            //     height: 75,
            //     child: Image.asset(
            //       "assets/pics/mouse.png",
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
          
          ],
        ),
      ],
    );
  }
}
