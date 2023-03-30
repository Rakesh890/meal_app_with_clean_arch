import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/presentation/home/home.screen.dart';
import 'package:meal_app_with_clean_arch/presentation/screens.dart';

import 'controllers/landing.controller.dart';

class LandingScreen extends GetView<LandingController> {
  const LandingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.index.value,
          children: [HomeScreen(), SearchScreen()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: controller.index.value,
            onTap: (value) => controller.index(value),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 28,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 28,
                  ),
                  label: "Search"),
            ]),
      ),
    );
  }
}
