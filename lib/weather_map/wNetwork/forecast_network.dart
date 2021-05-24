import 'dart:convert';

import 'package:udemy_app/weather_map/wModel/weather_forecast_model.dart';
import 'package:udemy_app/weather_map/wUtil/forecast_util.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<WeatherForeCastModel> getForecastData({String cityName}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${Util.apiKey}&units=metric';
    final weatherResponse = await http.get(Uri.parse(url));
    if (weatherResponse.statusCode == 200) {
      return WeatherForeCastModel.fromJson(json.decode(weatherResponse.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
