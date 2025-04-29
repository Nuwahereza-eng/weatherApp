import 'package:flutter/material.dart';
class WeatherForecastItem extends StatelessWidget {
  const WeatherForecastItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
                    elevation: 6,
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        
                      ),
                      child: Column(
                        children: [
                          Text("Monday",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10),
                          Icon(Icons.cloud,
                          size: 50,),
                          SizedBox(height: 10),
                          Text("300°F",
                          style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  );

  }
}