
import 'package:flutter/material.dart';
import 'package:my_weather_app/weather_screen.dart';
import 'additional_info.dart';
import 'hourly_forecast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
      ),

      body:Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,

        child: Column(
          children: <Widget>[
            WeatherScreen(),
            SizedBox(height: 20),
            Row(
                children: [
                  Text("Weather Forecast",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22
                  ))
                ]),
            HourlyForecast(),
            Row(
                children: [
                  Text("Weather Forecast",style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22
                  ))
                ]),
            AdditionalInfo(),
          ],
        ),
      ),
    );
  }
}