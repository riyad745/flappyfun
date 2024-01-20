// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Database/database.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';

class BirdSettings extends StatefulWidget {
  const BirdSettings({super.key});

  @override
  _BirdSettingsState createState() => _BirdSettingsState();
}

class _BirdSettingsState extends State<BirdSettings> {
  String selectedBird = ""; // Variable to keep track of the selected bird

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: myText("Characters", Colors.black, 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            birdOption("assets/pics/doge.png", "Doge"),
            birdOption("assets/pics/monkey.png", "Monkey"),
            // Uncomment the following line to add another bird option
            // birdOption("assets/pics/green.png", "Green"),
          ],
        ),
      ],
    );
  }

  Widget birdOption(String imagePath, String birdName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBird = imagePath;
          Str.bird = imagePath;
          write("bird", Str.bird);
        });
      },
      child: Column(
        children: [
          SizedBox(
            width: 75,
            height: 75,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                if (selectedBird == imagePath) // Show tick mark if selected
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 50,
                    weight: 500,
                  ),
              ],
            ),
          ),
          myText(birdName, Colors.black, 16),
        ],
      ),
    );
  }

  Widget myText(String text, Color color, double size) {
    // Your custom 'myText' widget implementation
    // Replace this with your actual implementation
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
