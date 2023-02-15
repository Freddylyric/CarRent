import 'package:car_rent/Screens/cars_overview.dart';
import 'package:car_rent/Screens/cars_page.dart';
import 'package:car_rent/Screens/car_details.dart';
import 'package:car_rent/Screens/share_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;

import 'notifications_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;

  final screens = [
    const CarsPage(),
    const CarsOverviewScreen(),
    const SharePage(),
    const NotificationsPage(),


  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],



      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,

        onTap: (index) => setState(()=>  currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Cars'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Share'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
      )
    );
  }


}
