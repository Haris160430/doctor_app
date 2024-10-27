import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../core/Network/Network/http_manager.dart';
import '../../../../core/models/general_list.dart';
import '../../../../core/models/services_model/services_model.dart';
import '../../../auth/widgets/auth_button.dart';
import '../../appointment/Widgets/datefield.dart';
import '../../appointment/Widgets/general_drop_down.dart';

class ServicesController extends GetxController {
  RefreshController Refcontroller = RefreshController();
  var isLoading = false.obs; // Observable to track loading state
  RxList<Services> services = <Services>[].obs; // Instance of HTTPManager
  RxList<GeneralListItem> mylist = <GeneralListItem>[].obs;

  Rx<GeneralListItem> selectedvalue = GeneralListItem().obs;
  @override
  void onInit() {
    super.onInit();
    mylist.add(GeneralListItem(id: "1",value: "4:00 to 4:30"));
    mylist.add(GeneralListItem(id: "2",value: "5:00 to 5:30"));
    mylist.add(GeneralListItem(id: "3",value: "6:00 to 6:30"));
    mylist.add(GeneralListItem(id: "4",value: "7:00 to 7:30"));
    mylist.add(GeneralListItem(id: "5",value: "8:00 to 8:30"));
    fetchPatientServices(); // Automatically call when the controller is initialized
  }

  onRef(int index)
  {
    if(index == 0)
    {
      fetchPatientServices();
    }

  }
  fetchPatientServices() {
    isLoading.value = true;

    HTTPManager().getPatientServices().then((value) {
      services.value = value.services!;
      isLoading.value = false;
    }).catchError((e) {
      print("this is error : $e");
      isLoading.value = false;
    });
  }

  bookAppointment() {
    isLoading.value = true;

    HTTPManager().getPatientServices().then((value) {
      services.value = value.services!;
      isLoading.value = false;
    }).catchError((e) {
      print("this is error : $e");
      isLoading.value = false;
    });
  }

  Future popup ()
  {
    return
        Get.dialog(
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Pop-up title
                  Text(
                    "Confirm Appointment",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10,),
                  DateField(label: 'Date',
                    onDateSelected: (DateTime ) { print(DateTime); },),
                  SizedBox(height: 20,),
                  // Display time slots using the RxList
                  GeneralDropDown(
                    hintText: "Select Time",
                    itemList: mylist,
                    onChange: (value) {
                      selectedvalue.value = value!;
                      print(value);
                    },
                    labelText: "Select Times",
                  ),
                  SizedBox(height: 150,),
                  AuthButton(onPressed: () {
                    bookAppointment();
                  },
                  buttonText: "Book an Appointment"),
                ],
              ),
            ),
          ),
        );
  }

}
