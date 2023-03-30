import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/injectoers.dart';
import 'package:meal_app_with_clean_arch/presentation/home/controllers/home.controller.dart';

import '../../../../presentation/landing/controllers/landing.controller.dart';

class LandingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(
      () => serviceLocator<LandingController>(),
    );
    Get.lazyPut<HomeController>(
      () => serviceLocator<HomeController>(),
    );
  }
}
