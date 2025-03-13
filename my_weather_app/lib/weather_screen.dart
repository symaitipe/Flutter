

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
    WeatherScreen({super.key});

   final Map<String,dynamic> screenData = {
       "temperature":"300",
       "icon": Icons.cloud,
       "condition": "Sunny"
     }
   ;
  @override
  Widget build(BuildContext context) {
    final data = screenData;
    return Container(
        padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      color: Color.fromARGB(120, 40, 40, 40),
        child: Column(
      children: [
        Text("${data["temperature"]} K",
        style:  TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30
          ),
        ),

        SizedBox(height: 10),

        Icon(data["icon"], size: 50, color: Colors.white),

        const SizedBox(height: 10),


         Text(data["condition"],
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20
          ),
        )
      ],
    )
    );
  }
}