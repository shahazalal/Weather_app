import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_pb/Pages/weather_home_page.dart';
import 'package:weather_app_pb/models/current_model.dart';
import 'package:weather_app_pb/provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherProvider(),
    builder: (context, _) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(elevation: 0),
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white, displayColor: Colors.white)),
      home: WeatherHomePage(),
    );
  }
}
