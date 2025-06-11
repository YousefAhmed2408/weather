import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/providers/registeration_provider.dart';
import 'package:untitled1/providers/weather_provider.dart';
import 'package:untitled1/screens/home_screen.dart';
import 'package:untitled1/screens/login.dart';
import 'package:untitled1/screens/sign_up.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

