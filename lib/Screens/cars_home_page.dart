import 'package:flutter/material.dart';
import 'package:car_rent/Screens/car_details_page.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;
import 'package:car_rent/utils/tabs.dart';
import 'package:car_rent/utils/utils.dart';
import 'package:car_rent/models/car.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: Scaffold(

              appBar: AppBar(
                // leading: IconButton(
                //   icon: const Icon(Icons.menu, color: Color(0xff302D2C)),
                //   onPressed: () {
                //     //  code to handle the menu button press
                //   },
                // ),
                title: const Text('Home', style: mainHeading),
                backgroundColor: AppColors.secondaryColor,
                centerTitle: true,
                elevation: 0,
              ),
              body:

              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    decoration: const BoxDecoration(color: Colors.white),
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/carLogo.png", height: 50, width: 120),
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

                                                ListView.builder(
                                                    itemCount: allCars.cars.length,
                                                    itemBuilder: (_, i) {



                                                      return GestureDetector(
                                                        onTap: (){
                                                          Navigator.of(context).push(MaterialPageRoute(
                                                              builder: (ctx)=> CarDetailsPage(
                                                                name: allCars.cars[i].name,
                                                                description: allCars.cars[i].description,
                                                                imgPath: allCars.cars[i].imgPath,
                                                                power: allCars.cars[i].power,
                                                                range: allCars.cars[i].range,
                                                                seats: allCars.cars[i].seats,
                                                                brand: allCars.cars[i].brand,
                                                                rating: allCars.cars[i].rating,
                                                                type: allCars.cars[i].type,
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

                                                                  const SizedBox(width: 10,),
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

                                              ]))
                                    ]
                                )
                            )


                          ]

                      )
                  ),

                ],

              ),


            ))
    );
  }
}


