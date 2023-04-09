import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/injectoers.dart';

import '../../../../presentation/search/controllers/search.controller.dart';

class SearchControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => serviceLocator<SearchController>(),
    );
  }
}
