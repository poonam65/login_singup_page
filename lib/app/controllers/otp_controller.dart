import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final otpControllers =
  List.generate(6, (_) => TextEditingController());

  RxInt seconds = 60.obs;
  Timer? timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    timer?.cancel();
    seconds.value = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds.value == 0) {
        t.cancel();
      } else {
        seconds.value--;
      }
    });
  }

  void resendCode() {
    startTimer();
    Get.snackbar("OTP", "OTP Resent (UI only)");
  }

  void verifyOtp() {
    final otp = otpControllers.map((e) => e.text).join();
    if (otp.length != 6) {
      Get.snackbar("Error", "Enter complete OTP");
      return;
    }
    Get.snackbar("Success", "OTP Verified");
    Get.offAllNamed('/home');
  }

  @override
  void onClose() {
    timer?.cancel();
    for (var c in otpControllers) {
      c.dispose();
    }
    super.onClose();
  }
}
