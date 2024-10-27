import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/splash_controller.dart'; // Import the controller

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // Initialize SplashScreenController using Get.put()
  final SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  Image.asset("assets/images/splash.png"),
                  SizedBox(height: 5),
                  Text(
                    "Mardan Orthodontic Center",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Note:",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Text(
              "Please do not visit the clinic except by appointment and when there is an emergency. It is important to call first.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
