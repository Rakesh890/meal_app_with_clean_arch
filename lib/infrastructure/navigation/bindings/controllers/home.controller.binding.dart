import 'package:get/get.dart';

import '../../../../injectoers.dart';
import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => serviceLocator<HomeController>(),
    );
  }
}
