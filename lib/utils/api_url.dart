import 'package:weatherapp_starter_project/api/api_key.dart';

String apiUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&exclude=minutely&units=metric";
  return url;
}
