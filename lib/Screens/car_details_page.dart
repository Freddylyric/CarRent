import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/car_model.dart';
import '../utils/utils.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;


class CarDetailsPage extends StatelessWidget {
   //const CarDetailsPage({Key? key}) : super(key: key);
   Car car;
   CarDetailsPage({super.key, required this.car});
  /*final String? name;
  final String? description ;
  final String? imgPath;
  final  String?  power;
  final  String? range;
  final  String?  seats ;
  final String? brand ;
  final  String?  rating;
  final String? type;

  const CarDetailsPage({super.key,
    @required this.brand,
    @required this.power,
    @required this.range,
    @required this.seats,
    @required this.imgPath,
    @required this.description,
    @required this.name,
    @required this.rating, @required this.type,

});*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(

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


        body: ListView(


            // crossAxisAlignment: CrossAxisAlignment.start,

          children:  [

            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.only(left: 13),
              child: Text('All the good stuff',
                style: mainHeading,


              ),
            ),
            const SizedBox(height: 5, ),
            const Padding(
              padding: EdgeInsets.only(left: 13),
              child: Text('Everything you need to know',
                style: subHeading,
                // textAlign: TextAlign.left,
              ),
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
                            image: FileImage(File(car.imgPath.toString()),
                            // fit: BoxFit.scaleDown,

                          )
                      ),

                    ),

                    ),
                    const SizedBox(height: 10,),
                    Text(car.name.toString(),
                      style: mainHeading,
                    ),
                    const SizedBox(height: 5,),
                    Text(car.brand.toString(),
                      style: subHeading,
                      // textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children:  [
                        const Icon(Icons.star, size: 24, color: Color(0xFFFFC817),),
                        const SizedBox(width: 5,),
                        Text(car.rating.toString(), style: subHeading)
                        // Text(rating as String, style: sub Heading,),
                      ]
                    ),

                    const Text('Description', style: mainHeading,),
                    const SizedBox(height: 5,),
                    Text(car.description .toString(), style: subHeading,),

                    const SizedBox(height: 10,),
                    Container(
                      height: 70,
                      width: 386,
                      padding: const EdgeInsets.only(left:20, top:10, bottom: 10, right: 20),
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
                                      style: mainHeading,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(car.power.toString(), style: subHeading,),
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
                                      style: mainHeading,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(car.seats.toString(), style: subHeading,),
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
                                      style: mainHeading,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(car.range.toString(), style: subHeading,),
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

    ]),

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



    ));
  }
}