import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/controllers/signup_controller.dart';
import '../../app/widgets/CustomTextField.dart';
import '../../app/widgets/primary_button.dart';

class SignupView extends StatelessWidget {
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) { // 👈 YOU NEED THIS METHOD
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
                      // App Icon with shield symbol for safety
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.redAccent.shade100.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.redAccent.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.shield,
                          size: 40,
                          color: Colors.redAccent.shade700,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Welcome title
                      Text(
                        "Create Your Safety Account",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.redAccent.shade700,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),

                      // Safety-focused subtitle
                      // Text(
                      //   "Join our community dedicated to your security",
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.grey.shade600,
                      //     height: 1.4,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      SizedBox(height: 30),

                      // Username field
                      CustomTextField(
                        label: "Full Name",
                        hintText: "Enter your full name",
                        controller: controller.usernameCtrl,
                        // Remove prefixIcon if your CustomTextField doesn't support it
                      ),
                      SizedBox(height: 20),

                      // Email field
                      CustomTextField(
                        label: "Email Address",
                        hintText: "you@example.com",
                        controller: controller.emailCtrl,
                        // Remove prefixIcon if your CustomTextField doesn't support it
                      ),
                      SizedBox(height: 20),

                      // Password field
                      Obx(() => CustomTextField(
                        label: "Password",
                        hintText: "Create a strong password",
                        controller: controller.passCtrl,
                        isPassword: true,
                        isPasswordHidden: controller.isPasswordHidden.value,
                        onPasswordToggle: controller.togglePass,
                        // Remove prefixIcon if your CustomTextField doesn't support it
                      )),
                      SizedBox(height: 20),

                      // Confirm password field
                      Obx(() => CustomTextField(
                        label: "Confirm Password",
                        hintText: "Re-enter your password",
                        controller: controller.confirmCtrl,
                        isPassword: true,
                        isPasswordHidden: controller.isConfirmHidden.value,
                        onPasswordToggle: controller.toggleConfirm,
                        // Remove prefixIcon if your CustomTextField doesn't support it
                      )),
                      SizedBox(height: 10),

                      // Password requirements hint
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.redAccent.shade100),
                        ),
                        child: Text(
                          "💡 Use at least 8 characters with a mix of letters, numbers, and symbols",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red.shade800,
                            height: 1.4,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // Terms and conditions checkbox
                      Row(
                        children: [
                          Obx(() => Checkbox(
                            value: controller.agreeTerms.value,
                            onChanged: (value) => controller.agreeTerms.value = value ?? false,
                            activeColor: Colors.redAccent.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(color: Colors.grey.shade700),
                                  ),
                                  TextSpan(
                                    text: "Terms & Conditions",
                                    style: TextStyle(
                                      color: Colors.redAccent.shade700,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " and ",
                                    style: TextStyle(color: Colors.grey.shade700),
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                      color: Colors.redAccent.shade700,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),

                      // Create Account button
                      Obx(() => PrimaryButton(
                        text: controller.isLoading.value
                            ? "CREATING ACCOUNT..."
                            : "CREATE SAFETY ACCOUNT",
                        onPressed: controller.isLoading.value || !controller.agreeTerms.value
                            ? null
                            : controller.signup,
                        // Remove backgroundColor if your PrimaryButton doesn't support it
                      )),

                      SizedBox(height: 20),

                      // Login link
                      TextButton(
                        onPressed: () => Get.toNamed("/login"),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.grey.shade700),
                            children: [
                              TextSpan(text: "Already have a safety account? "),
                              TextSpan(
                                text: "Login Now",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.redAccent.shade700,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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