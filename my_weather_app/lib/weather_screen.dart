

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  final double temperature;
  final String iconCode;
  final String condition;

   const WeatherScreen({super.key, required this.temperature, required this.iconCode, required this.condition});


  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      color: Color.fromARGB(120, 40, 40, 40),
        child: Column(
      children: [
        Text("$temperature K",
        style:  TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30
          ),
        ),

        SizedBox(height: 10),

        Image.network(
          "https://openweathermap.org/img/wn/$iconCode@2x.png", // Fetch icon dynamically
          width: 100,
          height: 100,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, size: 50, color: Colors.red);
          },
        ),

        const SizedBox(height: 10),


         Text(condition,
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