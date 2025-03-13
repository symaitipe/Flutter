

import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget{
   AdditionalInfo({super.key});

  final List<Map<String, dynamic>> additionalData = [
    {
      "icon": Icons.cloud,
      "placeholder": "Humidity",
      "measure": "90"
    },
    {
      "icon": Icons.wb_sunny,
      "placeholder": "Wind Speed",
      "measure": "7.87"
    },
    {
      "icon": Icons.grain,
      "placeholder": "Pressure",
      "measure": "1000"
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
                    data["measure"],
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