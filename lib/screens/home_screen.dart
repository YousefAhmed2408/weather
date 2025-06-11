import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/screens/weather_details_screen.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, value, child) {
          final countries = value.weatherModel?.weatherList;
          if (countries == null) {
            value.getWeather();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherDetailsScreen(
                            cityName:"${country["name"]}",
                            temperature: country["tempreature"],
                            imageUrl: country["imageUrl"],
                            weatherCondition: "${country["weatherCondition"]}"

                        ),
                      ),
                    );
                  },

                  child: WeatherItem(
                    cityName: countries[index]['name'],
                    temperature: countries[index]['tempreature'],
                    imageUrl: countries[index]['imageUrl'],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}


