import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIcon extends StatelessWidget {
  final String weatherCondition;
  WeatherIcon({super.key, required this.weatherCondition});

  @override
  Widget build(BuildContext context) {
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

    return Icon(iconData);
  }
}
