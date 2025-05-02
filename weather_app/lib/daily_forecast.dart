import 'package:flutter/material.dart';
class WeatherForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const WeatherForecastItem({super.key, required this.time, required this.temperature, required this.icon});
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
                          Text(time,
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10),
                          Icon(icon,
                          size: 50,),
                          SizedBox(height: 10),
                          Text(temperature,
                          style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  );

  }
}