import 'dart:io';

import 'package:car_rent/Screens/login/authentication_functions.dart';
import 'package:car_rent/Screens/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/Screens/car_details_page.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;
import 'package:car_rent/utils/tabs.dart';
import 'package:car_rent/utils/utils.dart';
import 'package:car_rent/models/car_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../remote_config.dart';

class CarsHomePage extends StatefulWidget {
  const CarsHomePage({Key? key}) : super(key: key);

  @override
  State<CarsHomePage> createState() => _CarsHomePageState();
}

class _CarsHomePageState extends State<CarsHomePage> with SingleTickerProviderStateMixin {

  late String _selectedOption;
  late TabController _tabController;
  late Future<void> bannerAdFuture;
  late BannerAd bannerAd, bannerAd2;
  bool isAdLoaded = false;
  bool isAdLoaded2 = false;
  var adUnit = "ca-app-pub-3940256099942544/6300978111"; //testing ad unit for banner1

  var adUnit2 = "ca-app-pub-3940256099942544/6300978111";

  // var interstitialAdUnit = "ca-app-pub-3940256099942544/1033173712";
  //
  // InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    bannerAdFuture = initBannerAd();

    // _createInterstitialAd();

    _tabController = TabController(length: 3, vsync: this);


    // _carBox = _carsList.carBox;
    // _carsList.loadCars();

  }

  Future<void> initBannerAd() async {
    bannerAd = BannerAd(
      adUnitId: adUnit,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (kDebugMode) {
            print(error);
          }
        },
      ),
    );
    await bannerAd.load();

    bannerAd2  = BannerAd(
      adUnitId: adUnit2,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdLoaded2 = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (kDebugMode) {
            print(error);
          }
        },
      ),
    );
    await bannerAd2.load();
  }



  // void _createInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: interstitialAdUnit,
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (ad) {
  //         _interstitialAd = ad;
  //       },
  //       onAdFailedToLoad: (error) {
  //         if (kDebugMode) {
  //           print('Ad failed to load: $error');
  //         }
  //       },
  //     ),
  //   );
  // }
  //
  // void _showInterstitialAd(Car car) {
  //   if (_interstitialAd == null) {
  //     return;
  //   }
  //
  //   _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdDismissedFullScreenContent: (ad) {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (ctx) => CarDetailsPage(car: car),
  //         ),
  //       );
  //       _createInterstitialAd();
  //     },
  //     onAdFailedToShowFullScreenContent: (ad, error) {
  //       if (kDebugMode) {
  //         print('$ad onAdFailedToShowFullScreenContent: $error');
  //       }
  //       _createInterstitialAd();
  //     },
  //   );
  //
  //   // Show the ad immediately
  //   _interstitialAd!.show();
  //   _interstitialAd = null;
  // }
  //


  // void _showInterstitialAd(Car car) {
  //   if (_interstitialAd == null) {
  //     return;
  //   }
  //
  //
  //   _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdDismissedFullScreenContent: (ad) {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (ctx) => CarDetailsPage(car: car),
  //         ),
  //       );
  //       _createInterstitialAd();
  //     },
  //     onAdFailedToShowFullScreenContent: (ad, error) {
  //       if (kDebugMode) {
  //         print('$ad onAdFailedToShowFullScreenContent: $error');
  //       }
  //       _createInterstitialAd();
  //     },
  //   );
  //
  //   _interstitialAd!.show();
  //   _interstitialAd = null;
  // }
  //
  // @override
  // void dispose() {
  //   _interstitialAd?.dispose();
  //   super.dispose();
  // }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: bannerAdFuture,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(


      appBar: AppBar(
        title:  Text('Home', style: mainHeading),
        backgroundColor: AppColors.secondaryColor,
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton(
            // color: styles.backgroundColor,
            icon: Icon(Icons.menu,size: 36, color: AppColors.accentColor,),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person, color: AppColors.primaryColor,),
                    SizedBox(width: 10),
                    Text('Profile', style: bodyText),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'privacy',
                child: Row(
                  children: [
                    Icon(Icons.privacy_tip, color: AppColors.primaryColor,),
                    SizedBox(width: 10),
                    Text('Privacy Policy', style: bodyText),

                  ],
                ),

              ),

              PopupMenuItem(
                value: 'logout',
                child: Column(
                  children: [
                    // SizedBox(height: 10,),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ), const SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.close, color: AppColors.primaryColor,),
                        const SizedBox(width: 10),
                         Text('Logout', style: bodyText,),
                      ],
                    ),
                    const SizedBox(height: 5,),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              setState(() {
                _selectedOption = value;
              });

              // Add menu option handling
              if (value == 'logout') {
                // Perform logout actions here
                AuthenticationFunctions.instance.signOut();
              }
              if (value == 'profile') {
                // Perform logout actions here
                Get.to((() => ProfileScreen()));
              }
            },
          ),
        ],

      ),
      body: SafeArea(

          child: Column(
              children: [
                if (isAdLoaded)
                  Container(
                    alignment: Alignment.center,
                    width: bannerAd.size.width.toDouble(),
                    height: bannerAd.size.height.toDouble(),
                    child: AdWidget(ad: bannerAd),
                  ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: const BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/drLogo.png", height: 50, width: 120),
                  // child: FutureBuilder(
                  //   future: FirebaseRemoteConfigClass().initializeConfig(),
                  //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //     if (snapshot.hasData) {
                  //       return Image.network(
                  //         snapshot.data,
                  //         height: 50,
                  //         width: 120,
                  //       );
                  //     } else {
                  //       return Image.asset("assets/images/drivioLogo.png", height: 50, width: 120);
                  //     }
                  //   },
                  // ),
                ),


                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,

                        backgroundColor: AppColors.secondaryColor,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: Container(

                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TabBar(

                              indicatorPadding: const EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: const EdgeInsets.only(right: 10),
                              controller: _tabController,
                              isScrollable: true,
                              indicatorColor: Colors.grey,
                              labelColor: Colors.white,
                              unselectedLabelColor: AppColors.bodyTextColor,
                              indicator: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(

                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 7,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              tabs: [

                                const AppTabs(text: "Popular"),
                                InkWell(
                                  child: const
                                  AppTabs(
                                    text: "Automatic",
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/cars/automatic');
                                  },
                                ),
                                InkWell(
                                  child: const
                                  AppTabs(
                                    text: "Electric",
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/cars/electric');
                                  },
                                ),
                              ],

                            ),

                          ),
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildListDelegate(
                              [

                                SizedBox(
                                    height: 550,
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [

                                        ValueListenableBuilder
                                          (valueListenable: Hive.box<Car>('car').listenable(), builder: (context, Box <Car> box,
                                                _) {
                                              // final allCars = box.values.toList();

                                              return Container(
                                                height: MediaQuery.of(context).size.height -
                                                    kBottomNavigationBarHeight -
                                                    bannerAd.size.height -
                                                    MediaQuery.of(context).padding.bottom,
                                                child: ListView.builder(itemCount: box.length,
                                                    itemBuilder: (ctx, i) {
                                                      final car = box.getAt(i);

                                                      return Card(child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: ListTile(
                                                            onTap: () {
                                                              Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                  builder: (ctx) => CarDetailsPage(car: car),
                                                                ),
                                                              );
                                                            },

                                                            leading: Container(
                                                              width: 90,
                                                              height: 90,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      10),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius: 2,
                                                                      offset: Offset(0, 2),
                                                                      color: Colors.grey.withOpacity(0.1),
                                                                    )

                                                                  ],
                                                                  image: DecorationImage(
                                                                    image: FileImage(
                                                                      File(car!.imgPath.toString()),),
                                                                    fit: BoxFit.scaleDown,

                                                                  )

                                                              ),
                                                            ),
                                                            title: Text(car!.name.toString(),
                                                              style: mainHeading,),
                                                            subtitle: Text(
                                                              car!.description.toString(),
                                                              style: subHeading,
                                                              maxLines: 2,
                                                              overflow: TextOverflow.ellipsis,),


                                                            trailing: IconButton(
                                                              onPressed: () {
                                                                box.deleteAt(i);
                                                              },
                                                              icon: const Icon(
                                                                  Icons.delete),
                                                            )
                                                        ),
                                                      ),);
                                                    }),
                                              );


                                            }),
                                        Container(),
                                        Container(),
                                      ],
                                    )
                                )
                              ]
                          )
                      )
                    ],
                  ),
                ),
              ])
      ),



          persistentFooterButtons:  [
            SizedBox(
              height: bannerAd2.size.height.toDouble(),
              width: bannerAd2.size.width.toDouble(),
              child: isAdLoaded2 ? AdWidget(ad: bannerAd2) : const SizedBox(),
            ),
          ],
    );

  } else {
        return const CircularProgressIndicator();
      }


});}}
