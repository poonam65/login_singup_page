import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_routes.dart' hide AppPages;
import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    );
  }
}
