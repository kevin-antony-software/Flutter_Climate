import 'package:climate/services/location.dart';

import 'network.dart';

const apiKey = '42d1aeabbb7a359048d5a9f8794921e0';
const apiKey1 = 'bd5e378503939ddaee76f12ad7a97608';

class WeatherModel {
  late double latitude;
  late double longtitude;

  Future<dynamic> getCityWeather(String cityName) async {
    String testCityURL =
        "https://api.openweathermap.org/data/2.5/weather?q={$cityName}&appid={$apiKey1}&units=metric";
    NetworkHelper networkHelper = NetworkHelper(testCityURL);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longtitude = location.longitude;
    String longti = longtitude.toString();
    String langti = latitude.toString();
    String test =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$langti&lon=$longti&exclude=hourly,daily&appid=$apiKey1&units=metric';
    String test1 =
        'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=42d1aeabbb7a359048d5a9f8794921e0&units=metric';
    NetworkHelper networkHelper = NetworkHelper(test1);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
