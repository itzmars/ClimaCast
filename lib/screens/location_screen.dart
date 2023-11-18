import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key, required this.description});
  final String description;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello, World"),
    );
  }
}
