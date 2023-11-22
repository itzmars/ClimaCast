import 'package:clima_cast/screens/location_screen.dart';
import 'package:clima_cast/services/location.dart';
import 'package:flutter/material.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const APIKEY = "1d8421344d08bdf8206821b040d5de7e";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  late String description;

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
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$APIKEY&units=metric');
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {

      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitDoubleBounce(color: Color(0xffffffff),
      duration: Duration(seconds: 2),)),
    );
  }
}
