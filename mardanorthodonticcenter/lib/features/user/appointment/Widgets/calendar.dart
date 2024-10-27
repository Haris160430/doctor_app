import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset("assets/images/calendar.svg"),
        SizedBox(width: 2,),
        Text("Calendar, 12 june",style: TextStyle(color: Color(0XFF8696BB)),),
      ],
    );
  }
}
