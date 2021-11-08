// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';


void main() {
  runApp(MyApp());
 
}
class MyApp extends StatefulWidget{
 
 
 @override
State<MyApp> createState()=> _MyAppState();


  

  }

  


class _MyAppState extends State<MyApp>{
  final _dataService = DataService();

  final _cityTextController = TextEditingController();
@override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center (
            child: Column( mainAxisAlignment: MainAxisAlignment.center, children:[
            
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
                 textAlign:TextAlign.center,
                 // ignore: prefer_const_constructors
                 ),
             ), 
             ),
            ElevatedButton(
              onPressed: _search, 
              child: Text('Search')
              
            ),
             ],
            
            ),
        ),
    ),
    );
    
  }
  void _search(){
    _dataService.getWeather(_cityTextController.text);
  }




}





