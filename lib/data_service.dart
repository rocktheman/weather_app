//import 'dart:convert';
import 'package:http/http.dart'as http;
class DataService{
     void getWeather(String city ){
          final queryParameters ={
           'q':city,
           'appid':'1b6e509e4cfc33a48debde6ac5ed4005',
  };

  final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather',queryParameters);
  final response = http.get(uri);
  print(response.body);
    
  
}

}