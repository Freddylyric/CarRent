import 'package:car_rent/widgets/form/form_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              FormHeaderWidget(
                  size: size,
                  image: appLogo,
                  title: "Get on Board!",
                  subtitle: "Create your profile to start your Journey"),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Form(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(

                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: Icon(Icons.person),
                        // hintText: 'Enter your full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        )
                      )
                    ),
                    SizedBox(height: 10),
                    TextFormField(

                        decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            // hintText: 'Enter your full name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            )
                        )
                    ),
                    SizedBox(height: 10),
                    TextFormField(

                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone),
                            // hintText: 'Enter your full name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            )
                        )
                    ),
                    SizedBox(height: 10),
                    TextFormField(

                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            // hintText: 'Enter your full name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            )
                        )
                    ),
                    SizedBox(height: 10),
                    TextFormField(

                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            // hintText: 'Enter your full name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            )
                        )
                    ),
                    SizedBox(height: 20),

                    ElevatedButton(onPressed: (){
                      //todo: add functionality to sign up
                    }, child: const Text("Sign Up"),
                    style: ButtonStyleConstants.primaryButtonStyle),

                  ],
                )),
              ),
              
              Column(
                children: [
                  Text("OR"),
                  OutlinedButton(onPressed: (){}, child: Text("Sign in with Google"))
                ],
              )
            ],
          ),
          
          
        ),
      ),
    );
  }
}
