import 'package:flutter/material.dart';
import 'package:world_weather_app/pages/home.dart';
import 'package:world_weather_app/pages/loading.dart';
import 'package:world_weather_app/pages/choose_location.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/location',
    routes: {
      '/': (context)=>Loading(),
      '/home': (context)=>Home(),
      '/location': (context)=> ChooseLocation()
    },
  ));
}
