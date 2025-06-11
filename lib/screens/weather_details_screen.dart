import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_item.dart';

class WeatherDetailsScreen extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String weatherCondition;
  final String imageUrl;
  const WeatherDetailsScreen({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.imageUrl,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather Details",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded to give space for the column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CityName: $cityName", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text("temperature: $temperature °C", style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text("$weatherCondition", style: const TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(width: 10), // optional space between text and image
            Image.network(imageUrl, width: 70, height: 70),
          ],
        ),
      ),

    );
  }
}