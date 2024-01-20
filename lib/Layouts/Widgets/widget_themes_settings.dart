// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../Database/database.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';

class ThemesSettings extends StatefulWidget {
  const ThemesSettings({super.key});
  @override
  State<ThemesSettings> createState() => _ThemesSettingsState();
}

class _ThemesSettingsState extends State<ThemesSettings> {
  String selectedTheme = "0"; // Variable to keep track of the selected theme

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Center(
            child: Text("Themes", style: TextStyle(fontSize: 20, fontFamily: "Magic4")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              themeOption("0", "assets/pics/0.png"),
              // Uncomment the following lines to add more theme options
              // themeOption("1", "assets/pics/1.png"),
              // themeOption("2", "assets/pics/2.png"),
            ],
          ),
        ],
      ),
    );
  }

  Widget themeOption(String themeId, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTheme = themeId;
          Str.image = themeId;
          write("background", Str.image);
          background(Str.image);
        });
      },
      child: Column(
        children: [
          SizedBox(
            width: 73,
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 73,
                  height: 60,
                ),
                if (selectedTheme == themeId) // Show tick mark if selected
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 30,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
