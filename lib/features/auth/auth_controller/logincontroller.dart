import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mardanorthodonticcenter/core/Network/Network/http_manager.dart';
import 'package:mardanorthodonticcenter/features/admin/admin_screen.dart';
import 'package:mardanorthodonticcenter/features/user/services/pages/services_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/models/login_dto/login_request_model.dart';

class LoginController extends GetxController {
 TextEditingController username = TextEditingController();
 TextEditingController password = TextEditingController(); // Fixed spelling

 // Sign in function
 sign_in() async {
  print(username.text);
  print(password.text);
  Get.to(() => ServicesScreen());

  HTTPManager().loginUser(LoginRequestModel(email: username.text, password: password.text))
      .then((apiResponse) async {
   // Check for a successful response
   if (apiResponse.status == "success") {
    // Save data to shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', apiResponse.token ?? '');  // Save the token
    await prefs.setString('username', username.text);
    await prefs.setString('user', apiResponse.user?.toJson().toString() ?? ''); // Convert the user object to JSON

    // Show success message


    if(apiResponse.user!.role == "admin")
     {
      Get.snackbar("ADMIN", "successfully logged in as Admin");
      Get.to(() => AdminScreen());
     }
    else
     {
      Get.snackbar("Success", "Logged in successfully");
      Get.to(() => ServicesScreen());
     }
    // Navigate to services screen

   } else {
    Get.snackbar("Error", apiResponse.message ?? "Invalid credentials");
   }
  }).catchError((onError) {
   print(onError);

   if (onError == "Invalid credentials") {
    Get.snackbar("Error", "Invalid credentials");
   } else {
    Get.snackbar("Error", "Something went wrong");
   }
  });
 }

 // Function to load saved data (optional, if needed)
 Future<void> loadUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  String? savedUsername = prefs.getString('username');
  // You can load other saved data here as needed
  print("Saved token: $token");
  print("Saved username: $savedUsername");
 }
}
