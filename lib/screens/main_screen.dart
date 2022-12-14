import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_kodluyoruz/utils/weather.dart';


class MainScreen extends StatefulWidget {
  final WeatherData weatherData;

  MainScreen({required this.weatherData});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int temperature;
  late Icon weatherDisplayIcon;
  late AssetImage backgroundImage;

  void updateDisplayInfo(WeatherData weatherData){
    setState(() {
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData = weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          )
        ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           SizedBox(height: 50,),
           Container(
             child: weatherDisplayIcon,
           ),
           SizedBox(height: 20,),
           Center(
             child: Text("${temperature}",
             style: TextStyle(
               color: Colors.orange,
               fontSize: 80.0,
               letterSpacing: -5
             ),),
           )
         ],
       ),
      ),
    );
  }
}
