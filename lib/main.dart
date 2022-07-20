import 'package:covid_tracker/screens/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins-Regular',
      ),
      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
    );
  }
}
