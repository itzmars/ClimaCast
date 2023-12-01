import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:clima_cast/services/networking.dart';
import 'package:clima_cast/services/location.dart';

const APIKEY = "1d8421344d08bdf8206821b040d5de7e";

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocalisation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.latitude}&appid=$APIKEY&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Widget WeatherIcon(String weatherCondition) {
    IconData iconData;

    switch (weatherCondition) {
      case '01d':
        iconData = WeatherIcons.day_sunny;
        break;
      case '01n':
        iconData = WeatherIcons.night_clear;
        break;

      case '04d':
        iconData = WeatherIcons.cloud;
        break;
      default:
        iconData = WeatherIcons.na;
    }

    return Icon(
      iconData,
      size: 100,
    );
  }
}
