import 'package:flutter/cupertino.dart';

import '../../../utils/utils.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.size, required this.image, required this.title, required this.subtitle,
  });

  final Size size;
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        Image(image: AssetImage(image), height: size.height*0.2,),
        Text(title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text(subtitle, style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
      ],
    );
  }
}
