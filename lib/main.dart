// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataService = DataService();

  final _cityTextController = TextEditingController();

  weatherResponse? _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network('${_response?.iconUrl}'),
                    Text(
                      '${_response?.tempratureInfo.temprature}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${_response?.weatherInfo.description}',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(
                      labelText: 'City',
                      hintText: 'Please enter valid city name',
                    ),
                    textAlign: TextAlign.center,
                    // ignore: prefer_const_constructors
                  ),
                ),
              ),
              ElevatedButton(onPressed: _search, child: Text('Search')),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    //print(response.cityName);
    //print(response.weatherInfo);
    //print(response.weatherInfo.description);
    //print(response.weatherInfo.Icon);

    setState(() => _response = response);
  }
}
