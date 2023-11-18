import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key, required this.locationWeather});
  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.locationWeather['weather'][0]['description']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hello, world'),
    );
  }
}
