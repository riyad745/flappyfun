// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';

class RateUs extends StatefulWidget {
  RateUs({super.key});

  @override
  State<RateUs> createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {

  final double rating = 4.0;
  late BannerAd bannerAd;
  bool isAdLoaded = false;

  initBannerAd(){
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-9073197646522848/7727194585", 
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print(error);
        },
      ), 
      request: AdRequest(

      ));

      bannerAd.load();
  }

    @override
  void initState() {
    super.initState();
    initBannerAd();
  }

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
      bottomSheet: isAdLoaded
            ? SizedBox(
                height: bannerAd.size.height.toDouble(),
                width: bannerAd.size.width.toDouble(),
                child: AdWidget(ad: bannerAd),
              )
            : const SizedBox(),
    );
  }
}
