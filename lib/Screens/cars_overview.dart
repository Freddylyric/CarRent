import 'package:car_rent/Screens/car_details.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;
import 'package:car_rent/utils/tabs.dart';
import 'package:car_rent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/models/car.dart';


class CarsOverviewScreen extends StatefulWidget {
  const CarsOverviewScreen({Key? key}) : super(key: key);


  @override
  _CarsOverviewScreenState createState() => _CarsOverviewScreenState();

}

class _CarsOverviewScreenState extends State<CarsOverviewScreen> with SingleTickerProviderStateMixin {

  late ScrollController _scrollController;
 late TabController _tabController;



  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);

  }




  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu,
                color: Color(0xff302D2C),),
              onPressed: () {
                //  code to handle the menu button press
              },
            ),
            title: const Text('Home',
            style: mainHeading,
            ),
            backgroundColor: AppColors.secondaryColor,

            centerTitle: true,
            elevation: 0,
          ),

          // SizedBox(
          //   height: 5,
          // ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
          color: Colors.white,),
                alignment: Alignment.centerLeft,
             child: Image.asset("assets/images/carLogo.png", height: 50,
          width: 120,),
              ),


              Expanded(
                  child: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder: (BuildContext context, bool isScroll ){

                      return [
                        SliverAppBar(
                          pinned: true,
                          backgroundColor: AppColors.secondaryColor,
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(0),

                            child: Container(
                              // margin: const EdgeInsets.all(0),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: TabBar(
                                indicatorPadding: const EdgeInsets.all(0),
                                indicatorSize: TabBarIndicatorSize.label,
                                labelPadding: const EdgeInsets.only(right: 10),
                                controller: _tabController,
                                isScrollable: true,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    )
                                  ]
                                ),

                                tabs: const [
                                  AppTabs(text: "Popular"),
                                  AppTabs(text: "Automatic"),
                                  AppTabs(text: "Electric"),

                                ],

                              ),
                            )
                          ),
                        )
                      ];

                    },

                    body: TabBarView(
                        controller: _tabController,
                        children:  [
                          // Container(
                          //   child: const Text('data'),
                          // ),
                      ListView.builder(
                          itemCount: allCars.cars.length,
                          itemBuilder: (_, i){


                        return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx)=> CarDetails(
                                    name: allCars.cars[i].name,
                                    description: allCars.cars[i].description,
                                    imgPath: allCars.cars[i].imgPath,
                                    power: allCars.cars[i].power,
                                    range: allCars.cars[i].range,
                                    seats: allCars.cars[i].seats,
                                    brand: allCars.cars[i].brand,
                                    rating: allCars.cars[i].rating,
                                  )));


                            },
                            child: Container(
                              margin: const EdgeInsets.only(left:13, right: 13, top: 5, bottom: 5),

                              child: Container(
                                decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),

                            color: AppColors.secondaryColor,
                            boxShadow: [
                            BoxShadow(
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                            color:Colors.grey.withOpacity(0.2),
                            )

                            ]
                            ),
                            padding: const EdgeInsets.all(5),

                            child: Container(
                            padding: const EdgeInsets.all(5),

                            child: Row(
                            children: [
                            Container(
                            width:90,
                            height: 90,
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
                            image: AssetImage(allCars.cars[i].imgPath),
                            fit: BoxFit.scaleDown,

                            )
                            ),

                            ),

                            SizedBox(width: 10,),
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(allCars.cars[i].name,
                            style: mainHeading,
                            ),
                            Text(allCars.cars[i].brand,
                            style: subHeading,
                            // textAlign: TextAlign.left,
                            ),
                            ],


                            )
                            ],
                            ),
                            ),
                            ),
                            ),

                            );



                      }),
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text('Content'),
                        ),
                      ),
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text('Content'),
                        ),
                      ),

                    ])
                  )
              )
            ]


      )

        )
      ),

    );
  }
}
