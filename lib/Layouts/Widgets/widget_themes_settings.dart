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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Center(child: Text("Themes",style: TextStyle(fontSize: 20,fontFamily: "Magic4")),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(onTap: (){
                setState(() {
                  Str.image = "0";
                  write("background", Str.image);
                  background(Str.image);
                });
              },child: Image.asset("assets/pics/0.png",width: 73,height: 60,)),
              // GestureDetector(onTap: (){
              //   setState(() {
              //     Str.image = "1";
              //     write("background", Str.image);
              //     background(Str.image);
              //   });
              // },child: Image.asset("assets/pics/1.png",width: 73,height: 60,)),
              // GestureDetector(onTap: (){
              //   setState(() {
              //     Str.image = "2";
              //     write("background", Str.image);
              //     background(Str.image);
              //   });
              // },child: Image.asset("assets/pics/2.png",width: 63,height: 60,)),
            
            ],
          ),
        ],
      ),
    );
  }
}