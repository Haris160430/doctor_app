import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mardanorthodonticcenter/features/auth/widgets/auth_button.dart';
import 'package:mardanorthodonticcenter/features/user/appointment/Widgets/general_drop_down.dart';

import '../../services/controller/services_controller.dart';
import '../Widgets/appointmentcontroller.dart';
import '../Widgets/datefield.dart';
import '../Widgets/schedule_container.dart';
import '../controller/appointment_controller.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final NewAppointmentController controller =
      Get.put(NewAppointmentController());

  @override
  Widget build(BuildContext context) {
    return

    Obx(()=>  controller.listAppointment.isNotEmpty? ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(top: 20),
        shrinkWrap: true,
        itemCount: controller.listAppointment.length,
        itemBuilder: (ctx, i) {
          return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: ScheduleContainer(
                ServiceText: controller.listAppointment[i].servicedis.toString(),
                subText: controller.listAppointment[i].servicedis.toString(),
                status: controller.listAppointment[i].status!,
              ));
        }):Center(child: CircularProgressIndicator()));
  }
}
