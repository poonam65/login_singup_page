import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // ⏳ Splash delay
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/login'); // or Routes.LOGIN
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 400,
              width: 400,
            ),
            // Icon(
            //   Icons.security,
            //   size: 100,
            //   color: Colors.white,
            // ),
            // const SizedBox(height: 20),
            // const Text(
            //   "Women Safety App",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //     letterSpacing: 1.2,
            //   ),
            // ),
            // const SizedBox(height: 10),
            // const Text(
            //   "Stay Safe. Stay Strong.",
            //   style: TextStyle(
            //     color: Colors.white70,
            //     fontSize: 14,
            //   ),
            // ),
            // const SizedBox(height: 30),

            // 🔄 Loader
            const CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
