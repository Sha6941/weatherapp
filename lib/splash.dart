import 'dart:async';

import 'package:flutter/material.dart';

import 'package:weather_app/Screen/home_page.dart';
import 'package:lottie/lottie.dart';

class Splashh extends StatefulWidget {
  const Splashh({super.key});

  @override

  State<Splashh> createState() => _SplashhState();
}

class _SplashhState extends State<Splashh> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>Homepage(),));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Lottie.asset("assets/json/Animation - 1714032045752.json",
                ),
                //Image.asset("assets/images/RadarWeather.png",scale: 5,),
                //Text("WEATHER APP",style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
