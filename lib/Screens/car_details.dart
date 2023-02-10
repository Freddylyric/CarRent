import 'dart:ffi';

import 'package:flutter/material.dart';

import '../models/car.dart';
import '../utils/utils.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;


class CarDetails extends StatelessWidget {
  // const CarDetails({Key? key}) : super(key: key);

  final String name;
  final String description ;
  final String imgPath;
  final String power;
  final String range;
  final double seats ;
  final String brand ;
  final double rating;

  CarDetails({
    required this.brand,
    required this.power,
    required this.range,
    required this.seats,
    required this.imgPath,
    required this.description,
    required this.name,
    required this.rating,

});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:SafeArea(

      child: Scaffold(


      appBar: AppBar(

        title: const Text('Car Details', style: mainHeading,),
        centerTitle: true,
        leading: const BackButton(
          color: Color(0xff302D2C),
        ),
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,

      ),


          body: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
            children:  [

              const Text('All the good stuff',
                style: mainHeading,

              ),
              const Text('Everything you need to know',
                style: subHeading,
                // textAlign: TextAlign.left,
              ),

              Container(
                height: 550.0,
                width: 386.0,
                margin: const EdgeInsets.only(left:13, right: 13, top: 10, bottom: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],

              ),

                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                        width:350,
                        height: 227,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                offset: const Offset(0, 0),
                                color:Colors.grey.withOpacity(0.2),
                              )

                            ],
                            image: DecorationImage(
                              image: AssetImage(imgPath),
                              fit: BoxFit.scaleDown,

                            )
                        ),

                      ),


                      Text(name,
                        style: mainHeading,
                      ),
                      Text(brand,
                        style: subHeading,
                        // textAlign: TextAlign.left,
                      ),
                      
                      Row(
                        children: [
                          const Icon(Icons.star, size: 24, color: Color(0xFFFFC817),),
                          Text(rating as String, style: subHeading,),
                        ]
                      )
                    ]
                      
                  )
                  
                  
              ),


          ],



    ))

      )
    );
  }
}
