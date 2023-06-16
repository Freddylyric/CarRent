import 'package:car_rent/Screens/login/user_functions.dart';
import 'package:car_rent/Screens/profile_screen.dart';
import 'package:car_rent/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/user_model.dart';

class UpdateProfileScreen extends StatefulWidget {


  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text('Edit Profile', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: FutureBuilder(
          future: controller. getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData){
                UserModel userData = snapshot.data as UserModel;


                //controllers
                final email = TextEditingController(text: userData.email);
                final name = TextEditingController(text: userData.name);
                final phoneNumber = TextEditingController(text: userData.phoneNumber);
                final password = TextEditingController(text: userData.password);

                return Container(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                      child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 70,
                                        backgroundImage: NetworkImage(userData.imageUrl ?? ''),
                                      ),
                                      if (userData.imageUrl == null || userData.imageUrl!.isEmpty)
                                        Icon(
                                          Icons.person,
                                          size: 70,
                                        ),
                                    ],
                                  ),


                                  Positioned(
                                      bottom: 0, right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle, color: Colors.red,),
                                        child: IconButton(
                                            onPressed: () {

                                              //TODO:PICK PROFILE IMAGE
                                              // controller.pickImage();
                                            }, icon: Icon(Icons.edit, color: Colors.white)),
                                      )
                                  )
                                ]
                            ),
                            SizedBox(height: 20,),
                            Form(
                              key: _formKey,
                              child: Column(
                                  children:[
                                    TextFormField(
                                        controller: name,

                                        decoration: InputDecoration(
                                            labelText: 'Name',
                                            labelStyle: subHeading,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.red)
                                            )

                                        )

                                    ),

                                    SizedBox(height: 20,),
                                    TextFormField(
                                        controller: email,

                                        decoration: InputDecoration(
                                            labelText: 'Email',
                                            labelStyle: subHeading,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.red)
                                            )

                                        )

                                    ),
                                    SizedBox(height: 20,),
                                    TextFormField(
                                        controller: phoneNumber,

                                        decoration: InputDecoration(
                                            labelText: 'Phone Number',
                                            labelStyle: subHeading,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.red)
                                            ))),
                                    SizedBox(height: 10,),
                                    Text("Enter your password before editing your profile", textAlign: TextAlign.center,),
                                    SizedBox(height: 10,),
                                    TextFormField(
                                        controller: password,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            labelText: 'Password',
                                            labelStyle: subHeading,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(color: Colors.red)
                                            )
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          } else if(value != userData.password){
                                            return 'Password does not match';
                                          }
                                          return null;

                                        }
                                    ),

                                    SizedBox(height: 20,),
                                    ElevatedButton(onPressed: (){
                                      //TODO: EDIT PROFILE

                                      if(_formKey.currentState!.validate()){
                                        final userData = UserModel(
                                            name: name.text.trim(),
                                            email: email.text.trim(),
                                            phoneNumber: phoneNumber.text.trim(),
                                            password: password.text.trim()
                                        );
                                      }

                                    }, child: Text("Edit Profile", style: whiteHeading,), style: ButtonStyleConstants.primaryButtonStyle,),
                                  ]
                              ),
                            ),




                            SizedBox(height: 30,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Member Since: ${userData.createdAt?.day}/${userData.createdAt?.month}/${userData.createdAt?.year}", style: bodyText,),
                                  ElevatedButton(onPressed: (){
                                    //TODO: DELETE PROFILE
                                    // Get.to(EditProfileScreen());
                                  }, child: Text("Delete", style: whiteHeading,), style: ButtonStyleConstants.smallButtonStyle,),

                                ]
                            )






                          ]
                      )
                  ),
                );

              } else if (snapshot.hasError){

                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child:Text("Something went wrong"));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }


          }
      ),
    );
  }
}