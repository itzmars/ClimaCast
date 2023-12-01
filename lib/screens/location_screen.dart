import 'package:clima_cast/usable_card.dart';
import 'package:flutter/material.dart';
import '../services/weather.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.locationWeather});
  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String description;
  late String weather;
  late String stringWeatherIcon;
  late String icon;
  late String country;
  late String humidy;


  @override
  void initState() {
    super.initState();
    convertWeather(widget.locationWeather);
  }


  void convertWeather(dynamic location) {
  
    setState(() {
      double temp = location['main']['temp'];
      country = location['sys']['country'];
      temperature = temp.toInt();
      description = location['weather'][0]['description'];
      stringWeatherIcon = location['weather'][0]['icon'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ClimaCast"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                country,
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: WeatherModel().WeatherIcon(stringWeatherIcon),
               ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(temperature.toString(), style: const TextStyle( fontSize: 50.0, fontWeight: FontWeight.bold),),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 28.0),
              ),
              const Expanded(child: SizedBox()),
              const Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                          child: UsableCard(
                        color: Color(0xff1d1e33),
                        childCard: Column(
                          children: [
                            Text("Humidity"),
                          ],
                        ),
                      )),
                      Expanded(
                          child: UsableCard(
                        color: Color(0xff1d1e33),
                        childCard: Column(
                          children: [
                            Text("Wind"),
                          ],
                        ),
                      ))
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                          child: UsableCard(
                        color: Color(0xff1d1e33),
                        childCard: Column(
                          children: [
                            Text("Visibility"),
                          ],
                        ),
                      )),
                      Expanded(
                          child: UsableCard(
                        color: Color(0xff1d1e33),
                        childCard: Column(
                          children: [
                            Text("Pressure"),
                          ],
                        ),
                      ))
                    ],
                  ))
                ],
              ))
            ],
          ),
        ));
  }
}
