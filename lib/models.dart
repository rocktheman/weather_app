/*{"coord":{"lon":67.0822,"lat":24.9056},
"weather":[{"id":721,"main":"Haze","description":"haze","icon":"50d"}],
"base":"stations","main":{"temp":304.05,"feels_like":302.11,"temp_min":304.05,"temp_max":304.05,"pressure":1015,"humidity":19},
"visibility":3000,"wind":{"speed":3.6,"deg":70},"clouds":{"all":5},"dt":1636353031,
"sys":{"type":1,"id":7576,"country":"PK","sunrise":1636335801,
"sunset":1636375651},"timezone":18000,"id":1174872,"name":"Karachi","cod":200} */

class weatherResponse {
  final String cityName;

weatherResponse({required this.cityName});
//factory creates something and return
  factory weatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    return weatherResponse(cityName: cityName);
  }
}
