import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_services.dart';


class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;

  Future<void> getWeather() async{
    weatherModel = await WeatherServices.getWeather();
    notifyListeners();
  }
}
