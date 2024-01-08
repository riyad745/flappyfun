// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Database/database.dart';
import '../../Global/constant.dart';
import '../../Global/functions.dart';

class MusicSettings extends StatefulWidget {
  const MusicSettings({super.key});

  @override
  State<MusicSettings> createState() => _MusicSettingsState();
}

class _MusicSettingsState extends State<MusicSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
              child: myText("Music",Colors.black,20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap: () async {
                write("audio", true);
                await player.resume();
              },
                  child: Icon(Icons.music_note_rounded,size: 30,)),
              GestureDetector(onTap: () async {
                write("audio", false);
                await player.pause();
              },
                  child: Icon(Icons.music_off_rounded,size: 30)),
            ],
          ),
        ],
      ),
    );
  }
}
