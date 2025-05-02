
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
  
  String cityName = 'Uganda';
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
 Future<Map<String, dynamic>> fetchWeatherData() async {
    
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=92426cabbce89d3a1bc03191b50665ea&units=metric'));
final data = jsonDecode(response.body);
    
    if (response.statusCode == 200) {
        return data; 
    } else {
      throw Exception('Unexpected error occurred!');
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
      body: 
       FutureBuilder(
        future: fetchWeatherData(),
        builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
           return Center(child: CircularProgressIndicator.adaptive());
         } else if (snapshot.hasError) {
           return Center(child: Text('Error: ${snapshot.error}'));
         } else if (!snapshot.hasData || snapshot.data == null) {
    return Center(child: Text('No data available.'));
         } 

        final data = snapshot.data!;

        final temp = data['list'][0]['main']['temp'].toDouble();
        final weatherDescription = data['list'][0]['main']['weather'][0]['description'];
        final humidity = data['list'][0]['main']['humidity'].toDouble();
        final windSpeed = data['list'][0]['main']['wind']['speed'].toDouble();
        final pressure = data['list'][0]['main']['pressure'].toDouble();
        final visibility = data['list'][0]['visibility'].toDouble();
          
          
         return Padding(
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
                          Icon(weatherDescription == 'clear' ? Icons.sunny : Icons.cloud,
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
                      for (int i = 0; i < 5; i++)
                      WeatherForecastItem(
                        time: data['list'][i+1]['dt'].toString(),
                        icon: Icons.sunny,
                        temperature: "${data['list'][i+1]['main']['temp']}°C",),
                      
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
               );
   } ),
    );
  } 
}
