import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class Pages {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => const DetailsScreen(),
      binding: DetailsControllerBinding(),
    ),
    GetPage(
      name: Routes.LANDING,
      page: () => const LandingScreen(),
      binding: LandingControllerBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => const SearchScreen(),
      binding: SearchControllerBinding(),
    ),
  ];
}
