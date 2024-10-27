import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../../../../core/Network/Network/http_manager.dart';
import '../../../../core/models/Appointment/new_appointment.dart';
import '../../services/controller/services_controller.dart';

class NewAppointmentController extends GetxController {
  var isLoading = false.obs;
  // The NewAppointment instance managed by this controller
  RxList<NewAppointmentModel> listAppointment = <NewAppointmentModel>[].obs;
  final ServicesController servicecontroller = Get.find<ServicesController>();

  // Function to update appointment date
  // void setAppointmentDate(String date) {
  //   newAppointment.update((appointment) {
  //     appointment?.date = date;
  //   });
  // }
@override
 onInit()  {
  super.onInit();
   GetAppoinment(); // Automatically call when the controller is initialized
}

   GetAppoinment()
   {
      isLoading.value = true;
     HTTPManager().GetPatientAppointment().then((value) {
       value.forEach((apidata){

         servicecontroller.services.forEach((value){
           print(apidata.serviceId);
           print(value.id);
           print("________________________");
           if(value.id == apidata.serviceId )
           {
             listAppointment.add(NewAppointmentModel(

               id: apidata.id,
               serviceId: apidata.userId,
               servicedis: value.name,
               date: apidata.date,
               time: apidata.time,
               status: apidata.status
             ));
           }
         });
       });


       isLoading.value = false;

     }).catchError((e) {
       print("this is error : $e");
       isLoading.value = false;
     });

}}
