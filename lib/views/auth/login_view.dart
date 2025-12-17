import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/controllers/login_controller.dart';
import '../../app/widgets/CustomTextField.dart';
import '../../app/widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey.shade50, Colors.grey.shade100],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 350,
              child: Card(
                color: Colors.white,
                elevation: 16,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logo2.png',
                        height: 80,
                        width: 80,
                      ),
                      // Brand/App Icon Placeholder
                      // Container(
                      //   width: 60,
                      //   height: 60,
                      //   decoration: BoxDecoration(
                      //     color: Colors.red.shade100.withOpacity(0.2), // Changed from redAccent
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      // //   child: Icon(
                      // //     Icons.security,
                      // //     size: 40,
                      // //     color: Colors.red.shade700, // Changed from redAccent
                      // //   ),
                      // // ),
                      // // SizedBox(height: 20),
                      //
                      // // Title in the brand's primary red
                      // ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.red.shade700, // Changed from redAccent
                        ),
                      ),
                      SizedBox(height: 8),

                      // Safety-focused tagline for trust
                      // Text(
                      //   "Sign in to your safety dashboard",
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.grey.shade600,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      SizedBox(height: 30),

                      CustomTextField(
                        label: "Email Address",
                        hintText: "Enter your email",
                        controller: controller.emailCtrl,
                        // REMOVED: prefixIcon parameter
                      ),
                      SizedBox(height: 20),

                      Obx(() => CustomTextField(
                        label: "Password",
                        hintText: "Enter your password",
                        controller: controller.passCtrl,
                        isPassword: true,
                        isPasswordHidden: controller.isPasswordHidden.value,
                        onPasswordToggle: controller.togglePassword,
                        // REMOVED: prefixIcon parameter
                      )),
                      SizedBox(height: 25),

                      // Login button
                      Obx(() => PrimaryButton(
                        text: controller.isLoading.value
                            ? "SIGNING IN..."
                            : "LOGIN ",
                        onPressed:
                        controller.isLoading.value ? null : controller.login,
                        // REMOVED: backgroundColor parameter
                      )),

                      SizedBox(height: 20),
                      // Subtle divider
                      Row(children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("OR", style: TextStyle(color: Colors.grey.shade500)),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ]),
                      SizedBox(height: 20),

                      // Secondary sign-up option
                      TextButton(
                        onPressed: () => Get.toNamed("/signup"),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.grey.shade700),
                            children: [
                              TextSpan(text: "New to SafetyApp? "),
                              TextSpan(
                                text: "Create Account",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red.shade700, // Changed from redAccent
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}