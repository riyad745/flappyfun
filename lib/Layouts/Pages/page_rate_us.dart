// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';

class RateUs extends StatelessWidget {
  RateUs({super.key});
  final double rating = 4.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: background(Str.image),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment(-1, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                RatingDialog(
                  title: myText("Rate Us", Colors.blueAccent, 25),
                  image: Icon(Icons.star, size: 100, color: Colors.red),
                  submitButtonText: 'Submit',
                  onSubmitted: (response) {
                    //go to rating page
                  },
                  // starPadding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust the padding as needed
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan.shade300,
                    ),
                    onPressed: () {
                      Share.share("play store link");
                    },
                    child: Icon(Icons.share_rounded, size: 30),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
