import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ClockWidgets extends StatelessWidget {
  const ClockWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset("assets/images/clock.svg"),
        SizedBox(width: 2,),
        Text("Morning",style: TextStyle(color: Color(0XFF8696BB)),),
      ],
    );;
  }
}
