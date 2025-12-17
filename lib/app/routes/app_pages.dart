import 'package:get/get.dart';

import '../../views/auth/splash_view.dart';
import '../../views/auth/login_view.dart';
import '../../views/auth/signup_view.dart';
import '../../views/auth/otp_view.dart';
import '../../views/auth/home_view.dart';

import '../bindings/login_binding.dart';
import '../bindings/signup_binding.dart';
import '../bindings/otp_binding.dart';
import '../bindings/home_binding.dart';

import '../controllers/home_controller.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [

    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: Routes.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),

    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
    ),
  ];
}
