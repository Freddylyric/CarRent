import 'package:car_rent/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//all firebase db user operations
class UserFunctions extends GetxController{
  static UserFunctions get instance => Get.find();


  //instance
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection("users").add(user.toJson()).whenComplete(
          () => Get.snackbar("Success", "Your account has been created",

        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,),
    )
        .catchError((e, stackTrace) {
      Get.snackbar("Error", "Something went wrong.Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,);
      print(
          e.toString());
    }
    );
  }

}
