import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'location.dart';

const apiKey = "4686017c980994d3722d6179c84e2e35";

class WeatherDisplayData{
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon,required this.weatherImage});
}

class WeatherData{
  WeatherData({required this.locationData});
  LocationHelper locationData;

  late double currentTemperature;
  late int currentCondition;

  Future<void> getCurrentTemperature() async{
    Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longtiude}&appid=${apiKey}&units=metric"));

    if(response.statusCode == 200){
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try{
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
      }catch(e){
        print(e);
      }
    }else {
      print("API'den deger gelmiyor.");
    }
  }

  getWeatherDisplayData() {
    if(currentCondition<600){
      return WeatherDisplayData(
          weatherIcon: Icon(
            FontAwesomeIcons.cloud,
            size: 75.0,
            color: Colors.white,
          ),
          weatherImage: AssetImage('assets/cloudly.png'));
    }else{
      var now = DateTime.now();
      if(now.hour>=19){
        return WeatherDisplayData(
            weatherIcon: Icon(
              FontAwesomeIcons.moon,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: AssetImage('assets/night.jpg'));
      }else{
        return WeatherDisplayData(
            weatherIcon: Icon(
              FontAwesomeIcons.sun,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: AssetImage('assets/sunny.png'));
      }
    }
  }
}