import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/App_Colors.dart';
import 'calendar.dart';
import 'clock.dart';

class ScheduleContainer extends StatelessWidget {
  final String ServiceText;
  final String subText;
  final String status;
  const ScheduleContainer({super.key, required this.ServiceText, required this.subText, required this.status});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16),
      // height: 140,
      width: 327,
      decoration: BoxDecoration(
        border: const Border(
            left: BorderSide(color: AppColors.primary, width: 4)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.10),
              spreadRadius: 0.5,
              blurRadius: 0.5)
        ],
        color: Colors.white,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ServiceText,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 20,
                width: 74,
                child: Center(child: Text(status,style: TextStyle(color: AppColors.onPrimary),)),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(7)),
              ),
            ],
          ),

          RichText(
            text: TextSpan(
              text: 'You have appointment for ',
              style: TextStyle(color: Colors.black45),
              children:  <TextSpan>[
                TextSpan(
                    text: subText ,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF8696BB))),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Divider(
            thickness: 3,
            color:Color(0XFFF5F5F5),),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              CalendarWidget(),
              ClockWidgets()
            ],
          )
        ],
      ),
    );;
  }
}
