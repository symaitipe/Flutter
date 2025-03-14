
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_weather_app/secret.dart';
import 'package:my_weather_app/weather_screen.dart';
import 'additional_info.dart';
import 'hourly_forecast.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//------------------------------------------------------------------------------
class _MyHomePageState extends State<MyHomePage> {

 late Future<Map<String,dynamic>> weatherDetails;

  Future<Map<String,dynamic>> getCurrentWeather() async{
    try{
      const city = 'Colombo';
       final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$weatherMapKey',
        ),
      );

       final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw data['cod'].toString();
      }

      Map<String, dynamic> weatherData = jsonDecode(res.body);

      // Get today's date in the format YYYY-MM-DD
      DateTime now = DateTime.now();
      String todayDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

      // Extract the list of weather forecasts
      List<dynamic> forecasts = weatherData["list"];

      // Filter today's weather data
      List<dynamic> todayWeather = forecasts.where((item) {
        String dtTxt = item["dt_txt"];
        return dtTxt.startsWith(todayDate);
      }).toList();

      // Create a new map for today's weather
      Map<String, dynamic> todayWeatherMap = {
        "date": todayDate,
        "weather_list": todayWeather
      };


      return todayWeatherMap;

    }catch(e){
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
      weatherDetails = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text(
            widget.title,
            style:TextStyle(
                fontWeight: FontWeight.w700
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weatherDetails = getCurrentWeather();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ], //Actions
      ),

      body:FutureBuilder(
          future: weatherDetails,
          builder: (buildContext, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );

            }

            final data = snapshot.data!;

            final todayWeatherList = data["weather_list"];

            final currentWeatherData = todayWeatherList[0];

            // weather Screen related data
            final currentTemp = currentWeatherData['main']['temp'];
            final currentSky = currentWeatherData['weather'][0]['icon'];
            final currentDescription = currentWeatherData['weather'][0]['description'];

            //additional info related data
            final currentPressure = currentWeatherData['main']['pressure'];
            final currentWindSpeed = currentWeatherData['wind']['speed'];
            final currentHumidity = currentWeatherData['main']['humidity'];

            return Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,

              child: Column(
                children: <Widget>[
                  WeatherScreen(
                    temperature: currentTemp,
                    iconCode: currentSky,
                    condition: currentDescription,
                  ),
                  SizedBox(height: 20),
                  Row(
                      children: [
                        Text("Weather Forecast",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22
                        ))
                      ]),
                  HourlyForecast(weatherList: todayWeatherList),
                  Row(
                      children: [
                        Text("Weather Forecast",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22
                        ))
                      ]),
                  AdditionalInfo(
                    pressureMeasure: currentPressure,
                    windSpeedMeasure: currentWindSpeed,
                    humidityMeasure: currentHumidity
                  ),
                ],
              ),
            );
          } //Builder Class
      )
    );
  }
}