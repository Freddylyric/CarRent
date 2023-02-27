import 'dart:io';

import 'package:car_rent/Screens/cars_home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:car_rent/utils/colors.dart' as AppColors;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:car_rent/models/car_model.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:async';

import '../utils/utils.dart';



class AddCarScreen extends StatefulWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {

  final _formKey = GlobalKey<FormState>();

  File? image;
  String? name;
  String? description;
  String? brand;
  String?  power;
  String?  range;
  String?  seats;
  String? type;
  String? rating;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
      // TODO
    }

  }
  submitData() async{

    final isValid = _formKey.currentState!.validate();
    if(isValid){
      Hive.box<Car>('car').add(Car(
          name: name, description: description,
          imgPath: image!.path,
          brand: brand,  type: type, power: power, range:range, seats: seats, rating: rating, ));

    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CarsHomePage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        centerTitle: true,
        elevation: 0,
        title: const Text('Add a Car',style: mainHeading),


        actions: [
          IconButton(
            onPressed: submitData,
            icon: const Icon(Icons.save, color: Colors.red),
          )
        ],
      ),

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  autocorrect: false,
                  onChanged: (val){
                    setState(() {
                      name = val;
                    });
                  },
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  autocorrect: false,

                  minLines: 2,
                  maxLines: 10,
                  onChanged: (val){
                    setState(() {
                      description = val;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Power',
                  ),
                  autocorrect: false,

                  onChanged: (val){
                    setState(() {
                      power = val;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Range',
                  ),
                  autocorrect: false,

                  onChanged: (val){
                    setState(() {
                     range = val;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Seats',
                  ),
                  autocorrect: false,

                  onChanged: (val){
                    setState(() {
                      seats = val;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Type: Automatic/ Electric',
                  ),
                  autocorrect: false,

                  onChanged: (val){
                    setState(() {
                      type = val;
                    });
                  },
                ),


                const SizedBox(
                  height: 25,

                ),
                image == null ? Container() :
                Image.file(
                  File(image!.path),
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),

              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: pickImage,
        backgroundColor: Colors. red,
        child: const Icon(Icons.camera_enhance )),
    );
  }
}
