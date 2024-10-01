import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather%20respnse.dart';
import 'package:weather_app/services/location_picker.dart';
import 'package:weather_app/services/weather%20_service_provider.dart';

import '../Data/image path.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool clicked = false;
  @override
  void initState() {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    locationProvider.findPosition().then((_) {
      if (locationProvider.currentLocationName != null) {
        var city = locationProvider.currentLocationName!.locality;
        if (city != null) {
          Provider.of<WeatherServiceProvider>(context, listen: false)
              .fetchWeatherDataByCity(city);
        }
      }
    });

    // Provider.of<LocationProvider>(context, listen: false).findPosition();
    //Provider.of<LocationProvider>(context,listen:false).findPosition();

    //Provider.of<WeatherServiceProvide>(context,listen: false).fetchWeatherDataByCity("");

    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final locationProvider = Provider.of<LocationProvider>(context);
    final weatherProvider = Provider.of<WeatherServiceProvider>(context);

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 65, left: 20, right: 20, bottom: 20),
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagePath[1]))),
          child: Stack(
            children: [
              clicked == true
                  ? Positioned(
                      top: 50,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 45,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              Container(
                height: 50,
                child: Consumer<LocationProvider>(
                  builder: (context, locationProvider, child) {
                    var locationCity;
                    if (locationProvider.currentLocationName != null) {
                      locationCity =
                          locationProvider.currentLocationName!.locality;
                    } else {
                      locationCity = "Unknown Location";
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 45),
                                    child: Text(
                                      locationCity.isEmpty
                                          ? "Unknown location"
                                          : locationCity,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Text(
                                    "Good Morning",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                clicked = !clicked;
                              });
                            },
                            icon: Icon(
                              Icons.search,
                              size: 32,
                            ))
                      ],
                    );
                  },
                ),
              ),

              Align(
                  alignment: Alignment(0, -0.6),
                  child: Lottie.asset(
                    JS[1],
                  )),
              //Image.asset(
              //   BG[1],
              //   scale: 1.7,
              // )),
              Align(
                alignment: Alignment(0, -0.1),
                child: Container(
                  height: 130,
                  child: Column(
                    children: [
                      Text(
                        weatherProvider.weather!.main!.temp.toString(),
                        //weatherProvider.weather!.weather![0].main!,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                      Text(
                        weatherProvider.weather!.weather![0].main!,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        DateTime.now().toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.4),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/high temp.png",
                                height: 50,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Temp Max",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "21C",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 25,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/temp min.webp",
                                height: 50,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Temp Min",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "21C",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/sunrice.png",
                                  height: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Sunrice",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "21C",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                // SizedBox(width: 10,)
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/sunset.png",
                                  height: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Sunset",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "21C",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
