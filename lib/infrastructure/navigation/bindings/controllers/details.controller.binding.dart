import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/injectoers.dart';

import '../../../../presentation/details/controllers/details.controller.dart';

class DetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
      () => serviceLocator<DetailsController>(),
    );
  }
}
