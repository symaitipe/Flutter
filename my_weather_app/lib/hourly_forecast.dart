


import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget{
  const HourlyForecast({super.key,required this.weatherList});

  final List<dynamic> weatherList;



  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherList.length,
          itemBuilder: (context, index) {

            final currentData = weatherList[index];

            String dtTxt = currentData["dt_txt"];
            String time = dtTxt.split(" ")[1].substring(0, 5);

            // Access the first item of the weather list
            String iconCode = currentData["weather"][0]["icon"];
            String condition = currentData["weather"][0]["description"];



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
                      time,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Image.network(
                      "https://openweathermap.org/img/wn/$iconCode@2x.png",
                      width: 40,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, size: 50, color: Colors.red);
                      },
                    ),

                    const SizedBox(height: 10),
                    Text(
                      condition,
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