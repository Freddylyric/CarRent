import 'dart:io';

import 'package:car_rent/Screens/car_details_page.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;
import 'package:car_rent/utils/tabs.dart';
import 'package:car_rent/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/models/car_model.dart';
import 'package:car_rent/Screens/cars_home_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';


class CarsListPage extends StatefulWidget {
  const CarsListPage({Key? key}) : super(key: key);

  @override
  _CarsListPageState createState() => _CarsListPageState();
}

class _CarsListPageState extends State<CarsListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
   TextEditingController? _textEditingController = TextEditingController();
   List <Car> carsOnSearch=[];




  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);



  }

  @override
  Widget build(BuildContext context) {

    final box = Hive.box<Car>('car');
    final List<Car> allCars = box.values.toList();
    final filteredCars = _textEditingController!.text.isNotEmpty ? carsOnSearch :allCars;
    final filteredAutomaticCars = filteredCars.where((car) => car.type == 'Automatic').toList();
    final filteredElectricCars = filteredCars.where((car) => car.type == 'Electric').toList();
    return Container(
        child: SafeArea(
            child: Scaffold(

              appBar: AppBar(

                leading: const BackButton(
                  color: Color(0xff302D2C),
                ),
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
                    padding: const EdgeInsets.all(10),
                    child: TextField(

                      onChanged: (value){
                        setState(() {

                          carsOnSearch = allCars.where((car) => car.name?.toLowerCase().contains(value.toLowerCase()) ?? false).toList();

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
                                                    itemCount: filteredCars.length,
                                                    itemBuilder: (_, i) {
                                                      return  Card( child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: ListTile(
                                                            onTap: (){

                                                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CarDetailsPage(car:filteredCars[i])));
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
                                                                    image: FileImage(File(filteredCars[i].imgPath.toString()),),
                                                                    fit: BoxFit.scaleDown,

                                                                  )

                                                              ),
                                                            ),
                                                            title:Text(filteredCars[i]. name.toString(), style: mainHeading,),
                                                            subtitle: Text(filteredCars[i]. description.toString(), style: subHeading, maxLines: 2,
                                                              overflow: TextOverflow.ellipsis,),


                                                            trailing: IconButton(
                                                              onPressed: (){
                                                                box.deleteAt(i);
                                                              },
                                                              icon: const Icon(Icons.delete),
                                                            )
                                                        ),
                                                      ),);



                                                    }),

                                                /// Automatic Car List

                                                _textEditingController!.text.isNotEmpty && carsOnSearch.isEmpty ?  Container(
                                                    padding: const EdgeInsets.all( 10),
                                                    child: const Text('No results found', style: mainHeading,)):
                                                ListView.builder(
                                                    itemCount: filteredAutomaticCars.length,
                                                    itemBuilder: (_, i) {

                                                      return  Card( child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: ListTile(
                                                            onTap: (){

                                                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CarDetailsPage(car:filteredAutomaticCars[i])));
                                                            },

                                                            leading: Container(
                                                              width:90,
                                                              height: 90,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  boxShadow:  [
                                                                    BoxShadow(
                                                                      blurRadius: 2,
                                                                      offset: const Offset(0, 2),
                                                                      color:Colors.grey.withOpacity(0.1),
                                                                    )

                                                                  ],
                                                                  image: DecorationImage(
                                                                    image: FileImage(File(filteredAutomaticCars[i].imgPath.toString()),),
                                                                    fit: BoxFit.scaleDown,

                                                                  )

                                                              ),
                                                            ),
                                                            title:Text(filteredAutomaticCars[i]. name.toString(), style: mainHeading,),
                                                            subtitle: Text(filteredAutomaticCars[i]. description.toString(), style: subHeading, maxLines: 2,
                                                              overflow: TextOverflow.ellipsis,),


                                                            trailing: IconButton(
                                                              onPressed: (){
                                                                box.deleteAt(i);
                                                              },
                                                              icon: const Icon(Icons.delete),
                                                            )
                                                        ),
                                                      ),);



                                                    }),

                                                _textEditingController!.text.isNotEmpty && carsOnSearch.isEmpty ?  Container(
                                                    padding: const EdgeInsets.all( 10),
                                                    child: const Text('No results found', style: mainHeading,)):


                                                ListView.builder(
                                                    itemCount: filteredElectricCars.length,
                                                    itemBuilder: (_, i) {


                                                      return  Card( child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: ListTile(
                                                            onTap: (){

                                                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CarDetailsPage(car:filteredElectricCars[i])));
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
                                                                    image: FileImage(File(filteredElectricCars[i].imgPath.toString()),),
                                                                    fit: BoxFit.scaleDown,

                                                                  )

                                                              ),
                                                            ),
                                                            title:Text(filteredElectricCars[i]. name.toString(), style: mainHeading,),
                                                            subtitle: Text(filteredElectricCars[i]. description.toString(), style: subHeading, maxLines: 2,
                                                              overflow: TextOverflow.ellipsis,),


                                                            trailing: IconButton(
                                                              onPressed: (){
                                                                box.deleteAt(i);
                                                              },
                                                              icon: const Icon(Icons.delete),
                                                            )
                                                        ),
                                                      ),);
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
