// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import '../../Global/constant.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';
import '../Widgets/widget_bird.dart';
import '../Widgets/widget_gradient _button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  @override
  State<StartScreen> createState() => _StartScreenState();
}
class _StartScreenState extends State<StartScreen> {
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

  final myBox = Hive.box('user');

  @override
  void initState() {
    // Todo : initialize the database  <---
    init();
    super.initState();
    initBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
      decoration: background(Str.image),
      child: Column(
        children: [
          // Flappy bird text
          SizedBox(height:20),
          Container(
              child: myText("Flappy Fun", Colors.white,40)),
              SizedBox(height: 15,),
          Bird(yAxis, birdWidth, birdHeight),
          SizedBox(height: 40,),
          _buttons(),
          AboutUs(size: size,)
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

// three buttons
Column _buttons(){
  return Column(
    children: [
      Button(buttonType: "text",height: 60,width: 278,icon: Icon(Icons.play_arrow_rounded,size: 60,color: Colors.green,),page: Str.gamePage,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Button(buttonType: "icon",height: 60,width: 110,icon: Icon(Icons.settings,size: 40,color: Colors.grey.shade900,),page: Str.settings,),
          Button(buttonType: "icon",height: 60,width: 110,icon: Icon(Icons.star,size: 40,color: Colors.deepOrange,),page: Str.rateUs,),
        ],
      ),
    ],
  );
}

class AboutUs extends StatelessWidget {
  final Size size;
  AboutUs({required this.size,super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
                colors: [Colors.white,Colors.grey.shade500],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
      ),
      margin: EdgeInsets.only(top: size.height * 0.1),
      child: GestureDetector(onTap: (){
        showDialog(context: context, builder: (context) {
          return dialog(context);
        },);
      },child: myText("About Us",Colors.black87,20)),
    );
  }
}
