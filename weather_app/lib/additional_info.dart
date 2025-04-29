
import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const AdditionalInfo({super.key, required this.icon, required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
      return Column(
                    children: [
                      Icon(icon,
                      size: 50,),
                      Text(title,
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10),
                      Text(value),
                    ],
                              );  
  }
}