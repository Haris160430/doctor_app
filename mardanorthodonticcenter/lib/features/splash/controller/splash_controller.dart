import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mardanorthodonticcenter/features/user/services/pages/services_screen.dart';
// import 'package:mardanorthodonticcenter/features/admin/pages/admin_screen.dart';
import 'package:mardanorthodonticcenter/features/auth/pages/login_screen.dart';

import '../../admin/admin_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();  // Check login status when the controller initializes
  }

  // Function to check if token exists and navigate based on role
  Future<void> checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 2));  // Optional delay

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? role = prefs.getString('role');  // Fetch the saved role

    if (token != null && token.isNotEmpty) {
      // Navigate based on the user's role
      if (role == 'admin') {
        Get.off(() => AdminScreen());  // Navigate to AdminScreen
      } else {
        Get.off(() => ServicesScreen());  // Navigate to User Screen
      }
    } else {
      Get.off(() => LoginScreen());  // Navigate to LoginScreen if no token
    }
  }
}
