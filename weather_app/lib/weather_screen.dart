
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/daily_forecast.dart';

class WeatherScreen extends StatelessWidget {
 const  WeatherScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App',style:
         TextStyle(fontSize: 24,fontWeight:
          FontWeight.bold)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // Handle settings action
              },
            ),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Column(
                        children: [Text("300°F",
                        style: TextStyle(fontSize: 48,fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Icon(Icons.cloud,
                        size: 100,),
                        SizedBox(height: 20),
                        Text("Rain",
                        style:TextStyle(fontSize: 32,),),
                        
                        ],
                                     ),
                                     ),
                    ),
                  )),
              ),
            SizedBox(height: 20),
                        Text("Weather Forecast",
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                        
                        ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherForecastItem(),
                    WeatherForecastItem(),
                    WeatherForecastItem(),
                    WeatherForecastItem(),
                    WeatherForecastItem(),
                  ],
                ),
              ),
                
                
              
           SizedBox(height: 20),
                        Text("Additional Information",
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                        
                        ), 
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AdditionalInfo(icon: Icons.thermostat, title: "Humidity", value: "60%"),
                            AdditionalInfo(icon: Icons.visibility, title: "Visibility", value: "10 km"),
                            AdditionalInfo(icon: Icons.speed, title: "Pressure", value: "1013 hPa"),
                            AdditionalInfo(icon: Icons.air, title: "Wind Speed", value: "15 km/h"),
                          ],
                        ),
          
          ],
          ),
        ),
      ),
    );
  } 
}
