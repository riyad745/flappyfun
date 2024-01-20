// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';
import '../Widgets/widget_bird_settings.dart';
import '../Widgets/widget_difficulty_settings.dart';
import '../Widgets/widget_music_settings.dart';
import '../Widgets/widget_themes_settings.dart';
import 'page_start_screen.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
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
      body: Container(
        decoration: background(Str.image),
        child: Column(
          children: [
            Container(
              alignment: Alignment(-1,0),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              },icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,)),
            ),
            Container(
              width: size.width * 0.92,
              height: size.height * 0.85,
              padding: EdgeInsets.all(10),
              decoration: frame(),
              child: Column(
                children: [
                  myText("Setting",Colors.pinkAccent,35),
                  BirdSettings(),
                  ThemesSettings(),
                  MusicSettings(),
                  DifficultySettings(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan.shade300,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen(),),);
                      }, child: myText("Apply",Colors.white,20) ),
                ],
              ),
            ),
          ],
        ),
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