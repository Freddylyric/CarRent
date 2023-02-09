import 'package:flutter/material.dart';
import 'Screens/cars_overview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      title: 'carRent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue
      ),
      home: const CarsOverviewScreen(),
    );
  }
}