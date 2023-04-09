import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meal_app_with_clean_arch/config.dart';
import 'package:meal_app_with_clean_arch/domain/entities/category_mean_entity.dart';
import 'package:meal_app_with_clean_arch/domain/usecases/category_meal_case.dart';

class SearchController extends GetxController with StateMixin {
  TextEditingController searchTextFiledController = TextEditingController();
  final count = 0.obs;
  final CategoryMealUseCase categoryMealCase;
  RxList<MealsEntity> searchList = <MealsEntity>[].obs;

  SearchController({required this.categoryMealCase});

  @override
  void onInit() {
    searchByKeywords('');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void searchWithKeywords(String value) {
    searchByKeywords(value);
  }

  Future<void> searchByKeywords(String value) async {
    change(null, status: RxStatus.loading());
    try {
      final result = await categoryMealCase
          .featchData('${ConfigEnvironments.mealSearchUrl}$value');
      result.fold((values) {
        searchList.value = values.meals;
        change(values, status: RxStatus.success());
      }, (error) {
        change(null, status: RxStatus.error('${error.runtimeType}'));
      });
    } catch (err) {
      change(null, status: RxStatus.error('${err.runtimeType}'));
    }
  }
}
