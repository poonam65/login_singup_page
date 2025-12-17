import 'package:get/get.dart';
import '../../views/auth/home_view.dart';
import '../../views/auth/login_view.dart';
import '../../views/auth/otp_view.dart';
import '../../views/auth/signup_view.dart';
import '../bindings/home_binding.dart';
import '../bindings/signup_binding.dart';
import '../controllers/home_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/otp_controller.dart';
import '../controllers/signup_controller.dart';

class Routes {
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const OTP = '/otp';
  static const HOME = '/home';
}




class AppPages {
  static final pages = [
    // LOGIN PAGE
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),

    // SIGNUP PAGE (Fixed: Removed duplicate, kept only one)
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(), // Using your dedicated binding
    ),

    // HOME PAGE

    GetPage(
      name: Routes.OTP,
      page: () => OtpView(),
      binding: BindingsBuilder(() {
        Get.put(());
      }),
    ),

    GetPage(
      name: '/home',
      page: () =>  HomeScreen(),
      binding: HomeBinding(),
    ),

  ];
}