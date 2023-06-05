import 'package:car_rent/Screens/login/widgets/login_footer_widget.dart';
import 'package:car_rent/Screens/login/widgets/login_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '';
import 'package:car_rent/utils/utils.dart';
import 'package:car_rent/utils/colors.dart' as app_colors;

import '../../utils/utils.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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


              const LoginForm(),
              LoginFooterWidget()

            ]
          ),

        )
      ),
    );
  }
}




