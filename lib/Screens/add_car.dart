import 'dart:io';

import 'package:car_rent/Screens/cars_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';



class AddCarScreen extends StatefulWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {

  final _formKey = GlobalKey<FormState>();
  late String _uniqueFileName= "";

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
      print(image.path);

      //create unique name for image using timestamp
     _uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

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


        // Create a new document reference in the "cars" collection
        final carRef = FirebaseFirestore.instance.collection('cars').doc();


        // Create a map of car data
        final carData = {
          'name': name,
          'description': description,
          'brand': brand,
          'power': power,
          'range': range,
          'seats': seats,
          'type': type,
          'rating': rating,
        };

        // Save the car data to Firestore
        await carRef.set(carData);

        // Upload the image file to Firebase Storage
        if (image != null) {

          // get a reference to storage root
          Reference referenceRoot = FirebaseStorage.instance.ref();
          Reference referenceDirImages = referenceRoot.child('images');

          //create a reference for the image to be stored
          Reference referenceImageToUpload = referenceDirImages.child(_uniqueFileName);

          try {
            await referenceImageToUpload.putFile(File(image!.path));
            final imageUrl= await referenceImageToUpload.getDownloadURL();
            carRef.update({'image_url': imageUrl});
            print("image stored");

          }catch(error){

          }
          // store teimage file







          // final storageRef =
          // FirebaseStorage.instance.ref().child('car_images/${carRef.id}');
          // final uploadTask = storageRef.putFile(image!);
          // await uploadTask.whenComplete(() {});
          //
          // final imageUrl = await storageRef.getDownloadURL();
          // carRef.update({'image_url': imageUrl});
        }

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
        title:  Text('Add a Car',style: mainHeading),



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
