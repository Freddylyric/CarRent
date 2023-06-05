import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/utils/utils.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
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
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){
                    //todo: add forgot password
                  },
                      child: Text("Forgot password?")),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    //todo: add functionality to login
                  }, child: const Text("LOGIN"),
                  style: ButtonStyleConstants.primaryButtonStyle),
                ),
              ]
          ),
        ));
  }
}