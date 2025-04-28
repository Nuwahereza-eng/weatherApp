
import 'dart:ui';

import 'package:flutter/material.dart';

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
                      SizedBox(
                        
                        child: Text("Weather Forecast",
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                        
                        ),
                      ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                Column(
                  children: [
                    Text("Tuesday",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Icon(Icons.cloud,
                    size: 50,),
                    SizedBox(height: 10),
                    Text("300°F",
                    style: TextStyle(fontSize: 18),),
                  ],
                ),
                Column(
                  children: [
                    Text("Wednesday",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Icon(Icons.cloud,
                    size: 50,),
                    SizedBox(height: 10),
                    Text("300°F",
                    style: TextStyle(fontSize: 18),),
                  ],
                ),
              ],
            )
              
              
            
          ],
        ),
      ),
    );
  }

  
}