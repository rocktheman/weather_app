/*{"coord":{"lon":67.0822,"lat":24.9056},
"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50d"}],
"base":"stations","main":{"temp":304.05,"feels_like":302.11,"temp_min":304.05,"temp_max":304.05,"pressure":1015,"humidity":19},
"visibility":3000,"wind":{"speed":3.6,"deg":70},"clouds":{"all":5},"dt":1636353031,
"sys":{"type":1,"id":7576,"country":"PK","sunrise":1636335801,
"sunset":1636375651},"timezone":18000,"id":1174872,"name":"Karachi","cod":200} */

class weatherResponse {
  final String cityName;
  final WeatherInfo weatherInfo;
  final TempratureInfo tempratureInfo;

  String get iconUrl {
    return 'http://openweathermap.org/img/wn/${weatherInfo.Icon}@2x.png';
  }

  weatherResponse(
      {required this.cityName,
      required this.weatherInfo,
      required this.tempratureInfo});
//factory creates something and return
  factory weatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final WeatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(WeatherInfoJson);

    final tempratureInfoJson = json['main'];
    final tempratureInfo = TempratureInfo.fromJson(tempratureInfoJson);

    return weatherResponse(
        cityName: cityName,
        weatherInfo: weatherInfo,
        tempratureInfo: tempratureInfo);
  }
}

class WeatherInfo {
  final String description;
  final String Icon;

  WeatherInfo({required this.description, required this.Icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final Icon = json['icon'];
    return WeatherInfo(description: description, Icon: Icon);
  }
}

class TempratureInfo {
  final double temprature;

  TempratureInfo({required this.temprature});

  factory TempratureInfo.fromJson(Map<String, dynamic> json) {
    final temprature = json['temp'];

    return TempratureInfo(temprature: temprature);
  }
}
