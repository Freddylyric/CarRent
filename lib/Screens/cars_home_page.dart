import 'dart:io';

import 'package:flutter/material.dart';
import 'package:car_rent/Screens/car_details_page.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;
import 'package:car_rent/utils/tabs.dart';
import 'package:car_rent/utils/utils.dart';
import 'package:car_rent/models/car_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../remote_config.dart';

class CarsHomePage extends StatefulWidget {
  const CarsHomePage({Key? key}) : super(key: key);

  @override
  State<CarsHomePage> createState() => _CarsHomePageState();
}

class _CarsHomePageState extends State<CarsHomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // _carBox = _carsList.carBox;
    // _carsList.loadCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


              appBar: AppBar(


                title: const Text('Home', style: mainHeading),
                backgroundColor: AppColors.secondaryColor,
                centerTitle: true,
                elevation: 0,
              ),
              body: SafeArea(

             child:  Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    decoration: const BoxDecoration(color: Colors.white),
                    alignment: Alignment.centerLeft,
                    child: FutureBuilder(
                      future: FirebaseRemoteConfigClass().initializeConfig(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Image.network(
                            snapshot.data,
                            height: 50,
                            width: 120,
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
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
                                    tabs:  [

                                      const AppTabs(text: "Popular"),
                                      InkWell(
                                        child: const
                                        AppTabs(
                                          text: "Automatic",
                                        ),
                                        onTap: () {
                                          Navigator.pushNamed(context, '/cars/automatic');
                                        },
                                      ),
                                      InkWell(
                                        child: const
                                        AppTabs(
                                          text: "Electric",
                                        ),
                                        onTap: () {
                                          Navigator.pushNamed(context, '/cars/electric');
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
                                                  (valueListenable: Hive.box<Car>('car').listenable(),
                                                    builder: (context, Box <Car> box, _) {
                                                      // final allCars = box.values.toList();

                                                      return ListView.builder(
                                                          itemCount: box.length,
                                                          itemBuilder: (ctx,
                                                              i) {
                                                            final car = box.getAt(i);

                                                           return  Card( child: Padding(
                                                             padding: const EdgeInsets.all(8.0),
                                                             child: ListTile(
                                                               onTap: (){
                                                                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CarDetailsPage(
                                                                      car: car,)));
                                                                /* Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CarDetailsPage(
                                                                     brand: car!. brand,
                                                                     power: car!. power,
                                                                     range: car!.range,
                                                                     seats: car!.seats,
                                                                     imgPath: car!.imgPath,
                                                                     description: car!.description,
                                                                     name: car!.name,
                                                                     rating: car!.rating,
                                                                     type: car!.type)));*/
                                                               },

                                                               leading: Container(
                                                            width:90,
                                                            height: 90,
                                                            decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10),
                                                            boxShadow:  [
                                                            BoxShadow(
                                                            blurRadius: 2,
                                                            offset: Offset(0, 2),
                                                            color:Colors.grey.withOpacity(0.1),
                                                            )

                                                            ],
                                                                image: DecorationImage(
                                                                  image: FileImage(File(car!.imgPath.toString()),),
                                                                  fit: BoxFit.scaleDown,

                                                                )

                                                               ),
                                                               ),
                                                               title:Text(car!. name.toString(), style: mainHeading,),
                                                               subtitle: Text(car!. description.toString(), style: subHeading,  maxLines: 2,
                                                                 overflow: TextOverflow.ellipsis,),


                                                                 trailing: IconButton(
                                                                   onPressed: (){
                                                                     box.deleteAt(i);
                                                                   },
                                                                   icon: const Icon(Icons.delete),
                                                                 )
                                                             ),
                                                           ),);


                                                          });
                                                      // Material(
                                                      //   child: ListTile(
                                                      //     leading: CircleAvatar(
                                                      //       backgroundColor: Colors.grey,
                                                      //     ),
                                                      //     title: Text('Content'),
                                                      //   ),
                                                      // );
                                                      // Material(
                                                      //   child: ListTile(
                                                      //     leading: CircleAvatar(
                                                      //       backgroundColor: Colors.grey,
                                                      //     ),
                                                      //     title: Text('Content'),
                                                      //   ),
                                                      // );

                                                    } )]
                                 )
                                )
                            ]
                                )
                      )
                  ],
                      ),
              ),
            ])
            )


        );


  }
}


