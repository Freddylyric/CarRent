import 'dart:ffi';
import 'dart:io';

import 'package:car_rent/Screens/api_trial.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../models/car_model.dart';
import '../utils/utils.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;


class CarDetailsPage extends StatefulWidget {
   //const CarDetailsPage({Key? key}) : super(key: key);




  final Car car;


  const CarDetailsPage({Key? key, required this.car, }) : super(key: key);


  @override
  _CarDetailsPageState createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  InterstitialAd? _interstitialAd;
  var interstitialAdUnit = "ca-app-pub-3940256099942544/1033173712";
  bool _adShown = false;

@override
void initState(){

  _createInterstitialAd();
  super.initState();
  // _showInterstitialAd(widget.car);
}
  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnit,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          // Show the ad as soon as it is loaded.
          if(!_adShown) {
            _showInterstitialAd(widget.car);
          }

        },
        onAdFailedToLoad: (error) {
          if (kDebugMode) {
            print('Ad failed to load: $error');
          }
        },
      ),
    );
  }
  void _showInterstitialAd(Car car) async {
      if (_interstitialAd == null) {
        return;
      }


      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          if (_adShown) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CarDetailsPage(car: widget.car),
              ),
            );
          } else {
            setState(() {
              _adShown = true;
            });
          }

          // _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          if (kDebugMode) {
            print('$ad onAdFailedToShowFullScreenContent: $error');
          }
          // _createInterstitialAd();
        },
      );

      _interstitialAd!.show();
      _interstitialAd = null;
    }

    @override
    void dispose() {
      _interstitialAd?.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

    child: Scaffold(


    appBar: AppBar(
      leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black)),
      title:  Text('Car Details', style: mainHeading,),
      centerTitle: true,
      backgroundColor: AppColors.secondaryColor,
      elevation: 0,

    ),


        body: ListView(


            // crossAxisAlignment: CrossAxisAlignment.start,

          children:  [

            const SizedBox(height: 10,),
             Padding(
              padding: EdgeInsets.only(left: 13),
              child: Text('All the good stuff',
                style: mainHeading,


              ),
            ),
            const SizedBox(height: 5, ),
             Padding(
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
                            image: NetworkImage(widget.car.imgPath.toString()?? '',
                            // fit: BoxFit.scaleDown,

                          )
                      ),

                    ),

                    ),
                    const SizedBox(height: 10,),
                    Text(widget.car.name.toString(),
                      style: mainHeading,
                    ),
                    // const SizedBox(height: 5,),
                    // Text(widget.car.brand.toString(),
                    //   style: subHeading,
                    //   // textAlign: TextAlign.left,
                    // ),
                    const SizedBox(height: 10,),
                    Row(
                      children:  [
                        const Icon(Icons.star, size: 24, color: Color(0xFFFFC817),),
                        const SizedBox(width: 5,),
                        Text(widget.car.rating.toString()?? '', style: subHeading)
                        // Text(rating as String, style: sub Heading,),
                      ]
                    ),

                     Text('Description', style: mainHeading,),
                    const SizedBox(height: 5,),
                    Text(widget.car.description .toString()?? '', style: subHeading,),

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

                                     Text(
                                      "Power",
                                      style: mainHeading,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(widget.car.power.toString(), style: subHeading, textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                     Text(
                                      "Seats",
                                      style: mainHeading,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(widget.car.seats.toString(), style: subHeading, textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                     Text(
                                      "Range",
                                      style: mainHeading,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(widget.car.range.toString(), style: subHeading, textAlign: TextAlign.center),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CarData()));
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