// WeatherItem.dart

import 'package:flutter/material.dart';
import '../screens/weather_details_screen.dart';

class WeatherItem extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String imageUrl;

  const WeatherItem({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl, width: 50, height: 50,),
      title: Text(cityName),
      subtitle: Text('$temperature°C '),

    );
  }
}
