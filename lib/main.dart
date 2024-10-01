import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/location_picker.dart';
import 'package:weather_app/services/weather%20_service_provider.dart';



import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider(),),
        ChangeNotifierProvider(create: (context)=>WeatherServiceProvider(),)
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title:"WEATHER APP",
          theme: ThemeData(
            appBarTheme: AppBarTheme(
            ),
            iconTheme: IconThemeData(
                color: Colors.white
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Splashh()
      ),
    );
  }
}
