import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_app/core/di/dependency_injection.dart';
import 'package:weather_app/weather_forcast_app.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setupGetIt();
  runApp(const WeatherForcastApp());
}
