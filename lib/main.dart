import 'package:clima_cast/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff040e21),
        scaffoldBackgroundColor: const Color(0xff040e21),
        appBarTheme: const AppBarTheme(
           backgroundColor: Color(0xff040e21),
        )
      ),
      home: LoadingScreen(),
    );
  }
}

