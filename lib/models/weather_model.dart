class WeatherModel {
  List<dynamic> weatherList;

  WeatherModel({required this.weatherList});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(weatherList: json['country']);
  }
}
