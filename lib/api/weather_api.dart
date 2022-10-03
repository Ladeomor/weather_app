
import 'dart:convert';

import 'package:weather_app/models/weather/daily.dart';
import 'package:weather_app/models/weather/hourly.dart';
import 'package:weather_app/util/api.dart';
import 'package:weather_app/models/weather/current.dart';
import 'package:weather_app/models/weather/weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/widgets/error_widget.dart';

class FetchApi{
  WeatherData? weatherData;

  Future<WeatherData?> getWeatherData(lat, lon)async{
    var response = await http.get(Uri.parse(url(lat, lon)));
    if(response.statusCode == 200) {
      var json = jsonDecode(response.body);
      weatherData = WeatherData(
          WeatherDataCurrent.fromJson(json), WeatherDataHourly.fromJson(json),
          WeatherDataDaily.fromJson(json));

      return weatherData;
    }else{
      throw ErrorWidget();
    }

  }
}

