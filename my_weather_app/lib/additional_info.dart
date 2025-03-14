

import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget{
   AdditionalInfo({super.key, required this.humidityMeasure, required this.windSpeedMeasure, required this.pressureMeasure});

   final int humidityMeasure;
   final double windSpeedMeasure;
   final int pressureMeasure;


   late final List<Map<String, dynamic>> additionalData = [
    {
      "icon": Icons.water_drop,
      "placeholder" : "Humidity",
      "measure": humidityMeasure
    },
    {
      "icon": Icons.air,
      "placeholder": "Wind Speed",
      "measure": windSpeedMeasure
    },
    {
      "icon": Icons.speed,
      "placeholder": "Pressure",
      "measure": pressureMeasure
    },

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        itemCount: 3, // Number of cards
        itemBuilder: (context, index) {
          final data = additionalData[index];
          return Card(
            margin: const EdgeInsets.all(8),
            elevation: 4,
            child: Container(
              width: 100, // Width of each card
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(data["icon"], size: 40, color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    data["placeholder"],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                   Text(
                    data["measure"].toString(),
                    style: TextStyle(
                      fontSize: 14,

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