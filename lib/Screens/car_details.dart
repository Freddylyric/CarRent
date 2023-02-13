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

              SizedBox(height: 10,),
              const Text('All the good stuff',
                style: mainHeading,

              ),
              SizedBox(height: 10,),
              const Text('Everything you need to know',
                style: subHeading,
                // textAlign: TextAlign.left,
              ),

              Container(
                // height: 550.0,
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


                      SizedBox(height: 10,),
                      Text(name,
                        style: mainHeading,
                      ),
                      const SizedBox(height: 5,),
                      Text(brand,
                        style: subHeading,
                        // textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children:  [
                          const Icon(Icons.star, size: 24, color: Color(0xFFFFC817),),
                          const SizedBox(width: 5,),
                          Text(rating.toString(), style: subHeading)
                          // Text(rating as String, style: sub Heading,),
                        ]
                      ),

                      const Text('Description', style: mainHeading,),
                      SizedBox(height: 5,),
                      Text(description, style: subHeading,),

                      SizedBox(height: 10,),
                      Container(
                        height: 70,
                        width: 386,
                        padding: const EdgeInsets.only(left:20, top:12, bottom: 12, right: 20),
                        margin: const EdgeInsets.only(left: 13, top: 10, right: 13),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: const Color(0xFFEDEFF2),
                          border: Border.all(
                            color: const Color(0xFFEDEFF2),
                            width: 1,
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 1000,
                            height: 65,
                            child: Row(
                              children: [
                                SizedBox(
                                  
                                  width: 100,
                                  height: 65,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [

                                      const Text(
                                        "Power",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(power),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 65,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      const Text(
                                        "Seats",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(seats.toString()),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 65,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      const Text(
                                        "Range",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(range),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )



                    ]

                      
                  )
                  
                  
              ),



          ],





    ),
        bottomNavigationBar: Container(
          height: 70,
          width: 414,

          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 2,
              ),
            ],
          ),
          child: Container(

            height: 48,
            width: 380,
            decoration: BoxDecoration(
              color: Colors.red[800],
              borderRadius: BorderRadius.circular(24),
            ),
            child: OutlinedButton(

              onPressed: () {
                // handle the button press here
              },
              child: const Text(
                'CONFIRM NOW',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 18 / 12, // line height in relation to font size
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),

            ),
          ),
        ),
      )

      )
    );
  }
}
