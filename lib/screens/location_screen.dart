import 'package:flutter/material.dart';
import '../services/weather_icon.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key, required this.locationWeather});
  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  late int temperature;
  late String description;
  late String weather;
  late String stringWeatherIcon;
  late String icon;

  @override
  void initState() {
    super.initState();
    convertWeather(widget.locationWeather);
  }

  void convertWeather(dynamic location) {
    double temp = location['main']['temp'];
    temperature = temp.toInt();
    stringWeatherIcon = location['weather'][0]['icon'];
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(children: [WeatherIcon(weatherCondition: stringWeatherIcon), Text(temperature.toString(),)],)),
    );
  }
}
