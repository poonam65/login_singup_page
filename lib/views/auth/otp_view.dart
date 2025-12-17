import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey.shade50, Colors.grey.shade200],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// HEADER
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back,
                                color: Colors.red.shade700),
                            onPressed: () => Get.back(),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "OTP Verification",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.red.shade800,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      /// ICON
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.red.shade200,
                            width: 3,
                          ),
                        ),
                        child: Icon(
                          Icons.verified_user,
                          size: 55,
                          color: Colors.red.shade700,
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// TITLE
                      Text(
                        "Verify Your Identity",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Colors.red.shade800,
                        ),
                      ),

                      const SizedBox(height: 12),

                      /// DESCRIPTION
                      Text(
                        "We've sent a 6-digit verification code to your email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// OTP BOXES
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          return Container(
                            width: 45,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: controller
                                    .otpControllers[index].text.isNotEmpty
                                    ? Colors.red.shade400
                                    : Colors.grey.shade300,
                                width: 2,
                              ),
                            ),
                            child: TextField(
                              controller:
                              controller.otpControllers[index],
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade800,
                              ),
                              decoration: const InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                              ),
                              onChanged: (v) {
                                if (v.isNotEmpty && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                }
                                if (v.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                                controller.update();
                              },
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 25),

                      /// TIMER
                      Obx(() => Text(
                        "Code expires in ${controller.seconds.value}s",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.red.shade700,
                        ),
                      )),

                      const SizedBox(height: 15),

                      /// RESEND
                      Obx(() => GestureDetector(
                        onTap: controller.seconds.value == 0
                            ? controller.resendCode
                            : null,
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.seconds.value == 0
                                ? Colors.red.shade700
                                : Colors.grey.shade400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )),

                      const SizedBox(height: 30),

                      /// VERIFY BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: controller.verifyOtp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            "VERIFY & CONTINUE",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      /// FOOTER NOTE
                      Row(
                        children: [
                          Icon(Icons.security,
                              color: Colors.red.shade700, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "This verification keeps your account secure",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
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
