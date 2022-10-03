import 'package:weather_app/constants/api.dart';

String url(var lat, var lon){
  String url;

  url = 'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey';
  return url;
}