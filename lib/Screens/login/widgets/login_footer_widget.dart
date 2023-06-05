import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("OR"),
        SizedBox(height: 10,),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image.asset("assets/images/google_icon.png", width: 20,),
            onPressed: (){}, label: Text("Sign in with Google"),
            style: ButtonStyleConstants.secondaryButtonStyle,
          ),
        ),
        SizedBox(height: 10,),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, "/sign_up");
          //todo: add functionality to signup
        },
            child:  Text.rich(
                TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(color: Colors.blue),
                      )
                    ]
                )))

      ],
    );
  }
}
