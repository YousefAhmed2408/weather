import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherServices {
  static Dio dio = Dio();

  static Future<WeatherModel> getWeather() async {
    try {
      Response response = await dio.get( 'https://elsewedyteam.runasp.net/api/Country/GetCountries');
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
