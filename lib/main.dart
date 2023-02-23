import 'package:car_rent/Screens/nav_page.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/Screens/cars_list_page.dart';
import 'Screens/cars_list_page.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      title: 'carRent',
      initialRoute: '/',
      routes:{
        // '/': (context) => const (),
    '/cars/automatic': (context) => const CarsListPage(),
    '/cars/electric': (context) => const CarsListPage(),},
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue
      ),
      home: const NavPage(),
    );
  }
}