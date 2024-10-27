import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mardanorthodonticcenter/core/theme/App_Colors.dart';
import 'package:mardanorthodonticcenter/features/auth/auth_controller/logout_controller.dart';

class AppbarWidgets extends StatelessWidget {
  final double Width;
  final String appbartext;
  const AppbarWidgets({super.key, required this.Width, required this.appbartext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Container(
          alignment: FractionalOffset.center,
          height: 50,
          width: Width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child:Text(appbartext, style: Theme.of(context).textTheme.titleMedium,) ,
        ),
        PopupMenuButton(
          icon:Icon(
            Icons.more_vert,
            color: AppColors.primary,
          ),onSelected: (String value) {
          // Handle menu item selection
          if (value == 'Settings') {
            // Navigate to settings page or handle other actions
          } else if (value == 'Logout') {
            Get.put(LogoutController().logout());
            // Handle logout action
          }
        },
            itemBuilder:  (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Settings',
                  child: Text('Settings'),
                ),
                PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ];
            })
        // SizedBox(width: 40,),
      ],
    );
  }
}
