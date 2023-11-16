import 'package:clima_cast/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    print("Get Data");
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocalisation();
  }

  void getData() async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=1d8421344d08bdf8206821b040d5de7e'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello, world")),
    );
  }
}
