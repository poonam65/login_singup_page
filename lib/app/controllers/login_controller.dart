import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../../views/auth/home_view.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() {
    final email = emailCtrl.text.trim();
    final password = passCtrl.text;

    if (email.isEmpty) {
      Get.snackbar("Error", "Email cannot be empty",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (!email.contains('@')) {
      Get.snackbar("Error", "Enter a valid email",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    if (password.isEmpty) {
      Get.snackbar("Error", "Password cannot be empty",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    isLoading.value = true;

    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
      Get.snackbar("Success", "Login successful",
          backgroundColor: Colors.green, colorText: Colors.white);

      // ✅ Navigate to HomeScreen
      Get.offAllNamed(Routes.HOME);
    });
  }
}
