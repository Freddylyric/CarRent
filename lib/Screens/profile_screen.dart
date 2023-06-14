import 'package:car_rent/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'login/authentication_functions.dart';
import 'login/user_functions.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Profile'),
      ),
      body: FutureBuilder(
        future: controller.getUserData(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData){
              UserModel userData = snapshot.data as UserModel;
              return  Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(userData.imageUrl ?? ''),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Email: ${userData.email}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Phone: ${userData.phoneNumber}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Member Since: ${userData.createdAt.day}/${userData.createdAt.month}/${userData.createdAt.year}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement edit profile functionality
                      },
                      child: Text('Edit Profile'),
                    ),
                  ],
                ),
              );


            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(child: Text("Something went wrong"));
            }

          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // String _formatDate(String dateString) {
  //   final date = DateTime.parse(dateString);
  //   return '${date.day}/${date.month}/${date.year}';
  // }
}


class ProfileController extends GetxController {
  static ProfileController get instance  =>Get.find();


  final _authFunctions = Get.put(AuthenticationFunctions());
  final _userFunctions = Get.put(UserFunctions());
  //query the data. first get user's email
   getUserData(){

     final email = _authFunctions.firebaseUser.value?.email;
     if (email != null){
      return  _userFunctions.getUserDetails(email);

     } else{
       Get.snackbar("Error", "Login to proceed");
     }
   }
}



