import 'dart:io';

import 'package:car_rent/Screens/nav_page.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/Screens/cars_list_page.dart';
import 'Screens/cars_list_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'models/car_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<Car>(CarAdapter());
  await Hive.openBox <Car>('Car');




  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

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