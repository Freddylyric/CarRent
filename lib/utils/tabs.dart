import 'package:car_rent/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class AppTabs extends StatelessWidget {

  final String text;
  const AppTabs({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      width: 115,
      decoration: const BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      alignment: Alignment.center,

      child: Text(
        text,
        style: subHeading,
      ),

    );
  }
}
