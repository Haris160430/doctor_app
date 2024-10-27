import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../core/models/general_list.dart';

class AppointmentController extends GetxController {
  // Observable list of appointment times
  RxList<GeneralListItem> mylist = <GeneralListItem>[].obs;
  Rx<GeneralListItem> selectedvalue = GeneralListItem().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    mylist.add(GeneralListItem(id: "1",value: "4:00 to 4:30"));
    mylist.add(GeneralListItem(id: "2",value: "5:00 to 5:30"));
    mylist.add(GeneralListItem(id: "3",value: "6:00 to 6:30"));
    mylist.add(GeneralListItem(id: "4",value: "7:00 to 7:30"));
    mylist.add(GeneralListItem(id: "5",value: "8:00 to 8:30"));
    super.onInit();
  }
  // Add time slots
  void addTimeSlot(GeneralListItem slot) {
    selectedvalue.value = slot;
  }
}
