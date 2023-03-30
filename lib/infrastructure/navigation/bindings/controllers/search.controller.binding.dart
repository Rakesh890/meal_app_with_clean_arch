import 'package:get/get.dart';

import '../../../../presentation/search/controllers/search.controller.dart';

class SearchControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
