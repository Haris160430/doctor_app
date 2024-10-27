import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../auth_controller/logincontroller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_pass_field.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  final LoginController controller = Get.put(LoginController());
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            // key: formKey,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 140,
                  ),
                  ClipRRect(
                    child: Image.asset(
                      'assets/images/splash.png',
                      width: 200,
                      height: 140,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      // please login to your account
                      const Text(
                        'Please login to your account',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: AppColors.onSurface),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // empID text field
                      AuthField(
                        hintText: 'User',
                        controller: widget.controller.username,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_mail.svg',
                          width: 48,
                          height: 48,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // password text field
                      AuthPassField(
                        hintText: 'Password',
                         controller: widget.controller.password,
                        prefixIcon: SvgPicture.asset(
                          'assets/images/ic_pwd.svg',
                          width: 48,
                          height: 48,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      // login button
                    ],
                  ),
                  AuthButton(
                      onPressed: () => widget.controller.sign_in(),
                      buttonText: 'Login'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
