import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_provider.dart';
import 'package:weather_app/theme/theme_provider.dart';
import 'package:weather_app/view/home/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
    ),
  ], builder: (context, child) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(
        context,
      ).themeData,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
