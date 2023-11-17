import 'package:clima_cast/services/location.dart';
import 'package:flutter/material.dart';
import '../services/networking.dart';

const APIKEY = "1d8421344d08bdf8206821b040d5de7e";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocalisation();

    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$APIKEY');
    var weatherData = await networkHelper.getData();
    var description = weatherData['weather'][0]['description'];
    print(description);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello, world")),
    );
  }
}
