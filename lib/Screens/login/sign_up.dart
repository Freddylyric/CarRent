import 'package:car_rent/Screens/login/authentication_functions.dart';
import 'package:car_rent/Screens/login/user_functions.dart';
import 'package:car_rent/widgets/form/form_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/user_model.dart';
import '../../utils/utils.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());
    // final _formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              FormHeaderWidget(
                  size: size, image: appLogo,
                  title: "Get on Board!",
                  subtitle: "Create your profile to start your Journey",
                crossAxisAlignment: CrossAxisAlignment.start,
                textAlign: TextAlign.start,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                            controller: controller.fullName,
                            decoration: InputDecoration(
                                labelText: 'Full Name',
                                prefixIcon: Icon(Icons.person),
                                // hintText: 'Enter your full name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ))),
                        const SizedBox(height: 10),
                        TextFormField(
                            controller: controller.email,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email_outlined),
                                // hintText: 'Enter your full name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ))),
                        const SizedBox(height: 10),
                        TextFormField(
                            controller: controller.phoneNumber,
                            decoration: InputDecoration(
                                labelText: 'Phone Number',
                                prefixIcon: Icon(Icons.phone),
                                // hintText: 'Enter your full name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ))),
                        const SizedBox(height: 10),
                        TextFormField(
                            controller: controller.password,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock_outline),
                                // hintText: 'Enter your full name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ))),
                        const SizedBox(height: 10),
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                prefixIcon: Icon(Icons.lock_outline),
                                // hintText: 'Enter your full name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ))),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              //todo: add functionality to sign up

                              if (_formKey.currentState!.validate()) {
                                SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                              }
                            },
                            child: Text("SIGN UP", style: whiteHeading,),
                            style: ButtonStyleConstants.primaryButtonStyle),
                      ],
                    )),
              ),
              Column(
                children: [
                  Text("OR", style: GoogleFonts.poppins(
                color: Colors.black,
              ),),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          //todo: add functionality to sign up with google
                        },
                        icon: Image.asset(
                          "assets/images/google_icon.png",
                          width: 20,
                        ),
                        label: Text("Sign in with Google",  style: GoogleFonts.poppins(
                          color: Colors.blue,
                        ),),
                        style: ButtonStyleConstants.secondaryButtonStyle,
                      )),
                  TextButton(
                      onPressed: () {},
                      child:  Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: "Sign in",
                            style: GoogleFonts.poppins(
                              color: Colors.blue,
                            ))
                      ])))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  //instance of userfns
  final userFunctions = Get.put(UserFunctions());

  //call this fn from design to register usr
  void registerUser(String email, String password) {
    //
    String? error = AuthenticationFunctions.instance.createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error,
      ));
    }
  }

  void createUser (UserModel user){
    userFunctions.createUser(user);
  }
}

// class SignUpController {
//   final fullName = TextEditingController();
//   final email = TextEditingController();
//   final phoneNumber = TextEditingController();
//   final password = TextEditingController();
//
//   final AuthenticationFunctions authFunctions;
//
//   SignUpController({required this.authFunctions});
//
//   void registerUser(String email, String password) {
//     authFunctions.createUserWithEmailAndPassword(email, password);
//   }
// }
