
import 'package:car_rent/utils/colors.dart' as AppColors;
import 'package:flutter/material.dart';

const mainHeading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    letterSpacing: 1,
    color: Color(0xff302D2C),
);

const subHeading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 18 / 12,
    letterSpacing: 1,
    color: Color(0xff8F8B8A),

);
const bodyText = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 12,
  fontWeight: FontWeight.w400,
  height: 18 / 12,
  letterSpacing: 1,
  color: Color(0xff8F8B8A),
);



const String appLogo = "assets/images/drLogo.png";


class ButtonStyleConstants {

  static const double buttonHeight = 50.0;
  static const double buttonWidth = 350.0;
  static const double smallButtonHeight = 50.0;
  static const double smallButtonWidth = 100.0;
  static const double borderRadius = 16.0;
  static const EdgeInsetsGeometry buttonPadding =
  EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0);
  static const Color primaryColor = Colors.redAccent;
  static const Color secondaryColor = Colors.white;

  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: buttonPadding,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    minimumSize: const Size(buttonWidth, buttonHeight),
  );

  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: secondaryColor,
    padding: buttonPadding,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    minimumSize: const Size(buttonWidth, buttonHeight),
  );
  static final ButtonStyle smallButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: buttonPadding,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    minimumSize: const Size(smallButtonWidth, smallButtonHeight),

  );
}

// class TextFormFieldTheme {
//   TextFormFieldTheme._();
//
//   static InputDecorationTheme
//
// }

