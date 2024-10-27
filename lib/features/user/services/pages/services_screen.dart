import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mardanorthodonticcenter/core/theme/app_colors.dart';
import 'package:mardanorthodonticcenter/core/widgets/appbar_widgets.dart';
import 'package:mardanorthodonticcenter/features/user/appointment/pages/appointment_screen.dart';
import 'package:mardanorthodonticcenter/features/user/widgets/services_container.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../core/models/services_model/services_model.dart';
import '../controller/services_controller.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final ServicesController controller = Get.put(ServicesController());
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(myIndex);
    return  Obx(()=>  Scaffold(
        backgroundColor: AppColors.backgroundScaf,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: myIndex == 0? AppbarWidgets(
              Width: 132, appbartext: 'Services',
            ): myIndex == 1? AppbarWidgets(
              Width: 152, appbartext: 'Appointment',
             ):myIndex == 2?AppbarWidgets(
             Width: 150, appbartext: 'Videos',
             ):AppbarWidgets(
              Width: 132, appbartext: '',
            )
        ),
        body:  myIndex == 0?
        controller.services.isNotEmpty?
        ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 20),
            shrinkWrap: true,
            itemCount: controller.services.length,
            itemBuilder: (ctx, i) {
              return Padding(
                padding:  EdgeInsets.only(left: 16,right: 16,bottom: 10),
                child:  ServicesContainer(
                  ServiceText:controller.services[i].name!,
                  subText:
                  controller.services[i].description!,
                  buttonText: "Book Appointment",
                  onPressed: (){controller.popup();},
                  url:   controller.services[i].image!,
                ),
              );
            }):Center(child: CircularProgressIndicator()): myIndex == 1? AppointmentScreen():SizedBox(),
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.white,
          height: 60,
          backgroundColor: AppColors.primary,
          selectedIndex: myIndex,
          onDestinationSelected: (value) {
            setState(() {
              myIndex = value;
            });
          },
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: SvgPicture.asset("assets/images/Services.svg"),
              selectedIcon: SvgPicture.asset("assets/images/SelectServices.svg"),
              label: 'Services',
            ),
            NavigationDestination(
              icon: SvgPicture.asset("assets/images/Appointment.svg"),
              selectedIcon: SvgPicture.asset("assets/images/SelectAppointment.svg"),
              label: 'Appointment',
            ),
            // NavigationDestination(
            //   icon: SvgPicture.asset("assets/Svg_icons/memorize.svg"),
            //   selectedIcon: SvgPicture.asset("assets/Svg_icons/memorize.svg"),
            //   label: 'Memorize',
            // ),
            NavigationDestination(
              icon: Icon(Icons.video_camera_back_outlined,color: AppColors.onPrimary,),
              selectedIcon: Icon(Icons.video_camera_back_outlined,color: AppColors.primary,),
              label: 'Vedios',
            ),
            NavigationDestination(
              icon: Icon(Icons.reviews_outlined,color: AppColors.onPrimary,),
              // SvgPicture.asset("assets/images/Schedule.svg"),
              selectedIcon: Icon(Icons.reviews_outlined,color: AppColors.primary,),
              // SvgPicture.asset("assets/images/SelectSchedule.svg"),
              label: 'Review',
            ),
            
          ],
        )
    ));
  }
}
