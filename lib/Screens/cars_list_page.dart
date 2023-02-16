import 'package:car_rent/Screens/car_details_page.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;
import 'package:car_rent/utils/tabs.dart';
import 'package:car_rent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/models/car.dart';
import 'package:flutter/src/widgets/framework.dart';


class CarsListPage extends StatefulWidget {
  const CarsListPage({Key? key}) : super(key: key);

  @override
  _CarsListPageState createState() => _CarsListPageState();
}

class _CarsListPageState extends State<CarsListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
   TextEditingController? _textEditingController = TextEditingController();
   List <CarItem> carsOnSearch=[];

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
                title: const Text('Cars List', style: mainHeading),
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


                  //search bar
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(

                      onChanged: (value){
                        setState(() {

                          carsOnSearch = allCars.cars.where((car) => car.name.toLowerCase().contains(value.toLowerCase())).toList();

                        });
                      },
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(15),
                      ),


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
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    indicatorColor: Colors.grey.withOpacity(0.5),
                                    labelColor: Colors.white,
                                    unselectedLabelColor: AppColors.bodyTextColor,
                                    tabs: const [

                                      AppTabs(text: "Popular"),
                                      AppTabs(text: "Automatic"),
                                      AppTabs(text: "Electric"),
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
                                              children:  [
                                                _textEditingController!.text.isNotEmpty && carsOnSearch.isEmpty ?  Container(
                                                  padding: const EdgeInsets.all( 10),
                                                    child: const Text('No results found', style: mainHeading,)):

                                                ListView.builder(
                                                    itemCount: _textEditingController!.text.isNotEmpty ? carsOnSearch.length: allCars.cars.length,
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
                                                                          image: AssetImage(_textEditingController!.text.isNotEmpty ? carsOnSearch[i].imgPath:allCars.cars[i].imgPath),
                                                                          fit: BoxFit.scaleDown,

                                                                        )
                                                                    ),

                                                                  ),

                                                                  const SizedBox(width: 10,),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(_textEditingController!.text.isNotEmpty ? carsOnSearch[i].name:allCars.cars[i].name,
                                                                        style: mainHeading,
                                                                      ),
                                                                      Text(_textEditingController!.text.isNotEmpty ? carsOnSearch[i].brand: allCars.cars[i].brand,
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

                                                /// Automatic Car List

                                                _textEditingController!.text.isNotEmpty && carsOnSearch.isEmpty ?  Container(
                                                    padding: const EdgeInsets.all( 10),
                                                    child: const Text('No results found', style: mainHeading,)):
                                                ListView.builder(

                                                    itemCount: _textEditingController!.text.isNotEmpty ? carsOnSearch.where((car) => car.type == 'Automatic').length: allCars.cars.where((car) => car.type == 'Automatic').length,
                                                    itemBuilder: (_, i) {
                                                      final automaticCars = _textEditingController!.text.isNotEmpty ? carsOnSearch.where((car) => car.type == 'Automatic').toList():
                                                                            allCars.cars.where((car) => car.type == 'Automatic').toList();


                                                      return GestureDetector(
                                                        onTap: (){
                                                          Navigator.of(context).push(MaterialPageRoute(
                                                              builder: (ctx)=> CarDetailsPage(
                                                                name: automaticCars[i].name,
                                                                description: automaticCars[i].description,
                                                                imgPath: automaticCars[i].imgPath,
                                                                power: automaticCars[i].power,
                                                                range: automaticCars[i].range,
                                                                seats: automaticCars[i].seats,
                                                                brand: automaticCars[i].brand,
                                                                rating: automaticCars[i].rating,
                                                                type: automaticCars[i].type,
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
                                                                          image: AssetImage(_textEditingController!.text.isNotEmpty ? carsOnSearch[i].imgPath: automaticCars[i].imgPath),
                                                                          fit: BoxFit.scaleDown,

                                                                        )
                                                                    ),

                                                                  ),

                                                                  const SizedBox(width: 10,),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        _textEditingController!.text.isNotEmpty ? carsOnSearch[i].name: automaticCars[i].name,
                                                                        style: mainHeading,
                                                                      ),
                                                                      Text(
                                                                        _textEditingController!.text.isNotEmpty ? carsOnSearch[i].brand: automaticCars[i].brand,
                                                                        style: subHeading,
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

                                                _textEditingController!.text.isNotEmpty && carsOnSearch.isEmpty ?  Container(
                                                    padding: const EdgeInsets.all( 10),
                                                    child: const Text('No results found', style: mainHeading,)):
                                                ListView.builder(

                                                    itemCount: _textEditingController!.text.isNotEmpty ? carsOnSearch.where((car) => car.type == 'Electric').length:
                                                    allCars.cars.where((car) => car.type == 'Electric').length,
                                                    itemBuilder: (_, i) {
                                                      final electricCars = _textEditingController!.text.isNotEmpty ? carsOnSearch.where((car) => car.type == 'Electric').toList():
                                                      allCars.cars.where((car) => car.type == 'Electric').toList();


                                                      return GestureDetector(
                                                        onTap: (){
                                                          Navigator.of(context).push(MaterialPageRoute(
                                                              builder: (ctx)=> CarDetailsPage(
                                                                name: electricCars[i].name,
                                                                description: electricCars[i].description,
                                                                imgPath: electricCars[i].imgPath,
                                                                power: electricCars[i].power,
                                                                range: electricCars[i].range,
                                                                seats: electricCars[i].seats,
                                                                brand: electricCars[i].brand,
                                                                rating: electricCars[i].rating,
                                                                type: electricCars[i].type,
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
                                                                          image: AssetImage( _textEditingController!.text.isNotEmpty ? carsOnSearch[i].imgPath: electricCars[i].imgPath),
                                                                          fit: BoxFit.scaleDown,

                                                                        )
                                                                    ),

                                                                  ),

                                                                  const SizedBox(width: 10,),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        _textEditingController!.text.isNotEmpty ? carsOnSearch[i].name: electricCars[i].name,
                                                                        style: mainHeading,
                                                                      ),
                                                                      Text(
                                                                        _textEditingController!.text.isNotEmpty ? carsOnSearch[i].brand:  electricCars[i].brand,
                                                                        style: subHeading,
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
