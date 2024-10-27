import 'package:get/get.dart';
import 'package:mardanorthodonticcenter/core/Network/Network/http_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/login_screen.dart'; // Adjust the import based on your project structure

class LogoutController extends GetxController {
  Future<void> logout() async {

    HTTPManager().logout().then((value){

      print(value);
    }).catchError((onError){});
    // Clear user session from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Adjust the key based on your implementation
    await prefs.remove('user'); // Remove other user data if needed
    await prefs.remove('username'); // Remove other user data if needed
    Get.snackbar("Success","Logout in successfully");
    // Navigate to the Login Screen
    Get.offAll(() => LoginScreen()); // Use GetX for navigation
  }
}
