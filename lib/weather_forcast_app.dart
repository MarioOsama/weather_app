import 'package:flutter/material.dart';

class WeatherForcastApp extends StatelessWidget {
  const WeatherForcastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forcast App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Weather Forcast App'),
        ),
      ),
    );
  }
}
