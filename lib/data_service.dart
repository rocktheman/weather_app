//import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';

class DataService {
  Future getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '1b6e509e4cfc33a48debde6ac5ed4005',
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    //print(response.body);

    final json = jsonDecode(response.body);
    return weatherResponse.fromJson(json);
  }
}
