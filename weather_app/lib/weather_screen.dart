
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/daily_forecast.dart';
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  // Constructor
 const  WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Define variables to store weather data
  double temp = 0.0;
  String weatherDescription = '';
  double humidity = 0.0;
  double windSpeed = 0.0;
  double pressure = 0.0;
  double visibility = 0.0;
  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }
  // Function to fetch weather data from the API
  // You can use the http package to make network requests
  // For example, you can use the following code to fetch weather data
  // from the OpenWeatherMap API
 Future fetchWeatherData() async {
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Uganda&appid=92426cabbce89d3a1bc03191b50665ea&units=metric'));
final data = jsonDecode(response.body);
    
    if (response.statusCode == 200) {
      setState(() {
        temp = data['main']['temp'].toDouble();
        weatherDescription = data['weather'][0]['description'];
        humidity = data['main']['humidity'].toDouble();
        windSpeed = data['wind']['speed'].toDouble();
        pressure = data['main']['pressure'].toDouble();
        visibility = data['visibility'].toDouble();
      });
      
    } else {
      throw Exception('Failed to load weather data');
    
    }
    
  }

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
                        children: [Text("$temp°C",
                        style: TextStyle(fontSize: 48,fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Icon(Icons.cloud,
                        size: 100,),
                        SizedBox(height: 20),
                        Text(weatherDescription,
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
                    WeatherForecastItem(day: "Monday",icon: Icons.sunny, temperature: "300°F"),
                    WeatherForecastItem(day: "Tuesday",icon: Icons.sunny_snowing, temperature: "290°F"),
                    WeatherForecastItem(day: "Wednesday",icon: Icons.cloud, temperature: "280°F"),
                    WeatherForecastItem(day: "Thursday",icon: Icons.cloud, temperature: "270°F"),
                    WeatherForecastItem(day: "Friday",icon:Icons.sunny ,temperature:  "260°F"),
                    
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
                            AdditionalInfo(icon: Icons.thermostat, title: "Humidity", value: "$humidity%"),
                            AdditionalInfo(icon: Icons.visibility, title: "Visibility", value: "$visibility km"),
                            AdditionalInfo(icon: Icons.speed, title: "Pressure", value: "$pressure hPa"),
                            AdditionalInfo(icon: Icons.air, title: "Wind Speed", value: "$windSpeed km/h"),
                          ],
                        ),
          
          ],
          ),
        ),
      ),
    );
  } 
}
