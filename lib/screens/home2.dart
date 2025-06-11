import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random/Screen/details.dart';

import '../Providers/weather_pro.dart';


class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather "),
      ),
      body: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, child) {
            final weatherObjectModel= weatherProvider.weatherModel;
            if (weatherObjectModel== null) {
              weatherProvider.getWeather();
              return const Center(child: CircularProgressIndicator());
            } else {
              return  ListView.builder(
                itemCount: weatherObjectModel.country.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => details(City: weatherObjectModel.country[index]))),
                      leading: Image.network(weatherObjectModel.country[index]["imageUrl"]),
                      title: Text(weatherObjectModel.country[index]["name"]),
                      subtitle: Text('${weatherObjectModel.country[index]["weatherCondition"]} • ${weatherObjectModel.country[index]["tempreature"]}C'),
                    ),
                  );
                },
              );


            }
          }


      ),
    );
  }
}