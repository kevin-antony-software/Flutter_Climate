import 'package:climate/services/location.dart';
import 'package:climate/services/network.dart';
import 'package:flutter/material.dart';

const apiKey = '42d1aeabbb7a359048d5a9f8794921e0';
const apiKey1 = 'bd5e378503939ddaee76f12ad7a97608';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  late double latitude;
  late double longtitude;

  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longtitude = location.longitude;
    String longti = longtitude.toString();
    String langti = latitude.toString();
    String test =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$langti&lon=$longti&exclude=hourly,daily&appid=$apiKey1';
    String test1 =
        'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=42d1aeabbb7a359048d5a9f8794921e0';
    NetworkHelper networkHelper = NetworkHelper(test1);
    var weatherData = await networkHelper.getData();
    print(weatherData['weather'][0]['description']);
    print(weatherData['sys']['country']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
