import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;
  var isConfirmHidden = true.obs;
  var agreeTerms = false.obs; // 👈 ADD THIS LINE

  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  void togglePass() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirm() {
    isConfirmHidden.value = !isConfirmHidden.value;
  }

  void signup() {
    final username = usernameCtrl.text.trim();
    final email = emailCtrl.text.trim();
    final password = passCtrl.text;
    final confirmPassword = confirmCtrl.text;

    // Validation
    if (username.isEmpty) {
      Get.snackbar("Error", "Please enter your name",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (email.isEmpty || !email.contains('@')) {
      Get.snackbar("Error", "Please enter a valid email",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (password.isEmpty || password.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords don't match",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (!agreeTerms.value) { // 👈 USE IT HERE
      Get.snackbar("Error", "Please agree to terms and conditions",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar("Success", "Account created successfully!",
          backgroundColor: Colors.green, colorText: Colors.white);

      // Navigate to home or verification screen
      Get.offAllNamed(Routes.OTP);
    });
  }
}