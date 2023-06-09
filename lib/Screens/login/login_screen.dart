import 'package:car_rent/Screens/login/widgets/login_footer_widget.dart';
import 'package:car_rent/Screens/login/widgets/login_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '';
import 'package:car_rent/utils/utils.dart';
import 'package:car_rent/utils/colors.dart' as app_colors;

import '../../utils/utils.dart';
import 'authentication_functions.dart';
import 'forget_password_mail.dart';
import 'widgets/login_form_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(SigninController());
  final _formKey = GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginHeaderWidget(size: size),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Form(
                        key: _formKey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                    controller: controller.email,
                                    decoration: InputDecoration(
                                        labelText: 'Email',
                                        prefixIcon: Icon(Icons.email),
                                        hintText: 'Enter your email',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),


                                        )
                                    )
                                ),

                                SizedBox(height: 20,),
                                TextFormField(
                                    controller: controller.password,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                      hintText: 'Enter your password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),

                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: null,
                                        //todo: add functionality to show/hide password
                                        icon: Icon(Icons.remove_red_eye),

                                      ),
                                    )
                                ),
                                SizedBox(height: 5,),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(onPressed: (){
                                    Get.to(()=> ForgetPasswordMailScreen());
                                    //todo: add forgot password
                                  },
                                      child: Text("Forgot password?",  style: GoogleFonts.poppins(
                                        color: Colors.blue,
                                      ),)),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(onPressed: (){
                                    //todo: add functionality to login
                                    if(_formKey.currentState!.validate()){
                                      SigninController.instance.loginUser(controller.email.text.trim(), controller.password.text.trim());
                                    }
                                  }, child:  Text("LOGIN", style: whiteHeading,),
                                      style: ButtonStyleConstants.primaryButtonStyle),
                                ),
                              ]
                          ),
                        )),
                  ),

                  LoginFooterWidget()

                ]
            ),

          )
      ),
    );
  }
}



class SigninController extends GetxController {

  static SigninController get instance => Get.find();


  final fullName = TextEditingController();
  final email = TextEditingController();
  final  phoneNumber = TextEditingController();
  final password = TextEditingController();


  //call this fn from design to register usr
  void loginUser (String email, String password) {

    //
    AuthenticationFunctions.instance.signInWithEmailAndPassword(email, password);
  }

}




