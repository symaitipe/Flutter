


import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget{
  HourlyForecast({super.key});

  final List<Map<String, dynamic>> weatherData = [
    {
      "icon": Icons.cloud,
      "time": "09.00",
      "condition": "Sunny",
      "temperature": "25°C",
    },
    {
      "icon": Icons.wb_sunny,
      "time": "12.00",
      "condition": "Clear",
      "temperature": "28°C",
    },
    {
      "icon": Icons.grain,
      "time": "15.00",
      "condition": "Rainy",
      "temperature": "22°C",
    },

  ];


  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            final data = weatherData[index];
            return Card(
              margin: const EdgeInsets.all(8),
              elevation: 4,
              child: Container(
                width: 150,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const SizedBox(height: 10),
                    Text(
                      data["time"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Icon(data["icon"], size: 40, color: Colors.white),

                    const SizedBox(height: 10),
                    Text(
                      data["condition"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      );
    }


}