import 'package:flutter/material.dart';
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
                                children: [
                                  Icon(Icons.thermostat,
                                  size: 50,),
                                  Text("Humidity",
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10),
                                  Text("60%"),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Icon(Icons.air,
                                  size: 50,),
                                  Text("Wind Speed",
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10),
                                  Text("15 km/h"),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Icon(Icons.visibility,
                                  size: 50,),
                                  Text("Visibility",
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10),
                                  Text("10 km"),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Icon(Icons.speed,
                                  size: 50,),
                                  Text("Pressure",
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10),
                                  Text("1013 hPa"),
                                ],
                              ),
    );
  }
}